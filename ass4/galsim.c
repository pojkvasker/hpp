#include <stdlib.h>
#include <stdio.h>
#include <math.h>
#include <stdbool.h>

// To access the simulation methods
#include "graphics.h"

#define e 1e-3 


typedef struct point { //reference point for the quadrangles (info of boundaries)
    double x,y;
} point_t;

typedef struct particle {
    double x,y,vx,vy,m,b;
} particle_t;

typedef struct quadrangle {
    struct quadrangle *quadrant[4];
    char leafnode;

    struct particle *particle;
    struct point origin; // BOTTOM LEFT
    
    double originx, originy;
    double width;
    double mass, xmass, ymass;
    
} quadrangle_t;


int read_doubles_from_file(double *, int, const char*);
int write_result_to_gal(double *, int);

int get_quadrant_number(quadrangle_t *, particle_t *);
quadrangle_t *quadrangle_init(double, double, double);
void addparticle(quadrangle_t *, particle_t *);
void quadrangle_free(quadrangle_t *);
void insertparticle(quadrangle_t*, particle_t*);
void quadrangle_subdivide(quadrangle_t *);
void update_velocity(quadrangle_t *, particle_t *, int, double);



quadrangle_t *quadrangle_init(double originx, double originy, double width) {
    quadrangle_t *tree = (quadrangle_t*)malloc(sizeof(quadrangle_t));
    
    if (!tree) { //CHECK IF ABLE TO MALLOC MEMORY TO TREE
        return NULL;
    }

    for(int i=0; i<4; i++) {
        tree->quadrant[i] = NULL; //initialize the partitions
    }

    tree->leafnode = 0; 
    tree->originx = originx;
    tree->originy = originy;
    tree->particle = NULL;
    tree->width = width;
    tree->mass = 0;
    tree->xmass = 0;
    tree->ymass = 0;
    return tree;
}


bool threshold_check(quadrangle_t *q, particle_t *p, double threshold) {
    //double threshold = 1.0;

    // TILL CENTER OF MASS (?)
    double theta = q->width / sqrt( (p->x - q->xmass)*(p->x - q->xmass) + (p->y + q->ymass)*(p->y + q->ymass) );

    return theta < threshold; //box is treated an an equivalent mass
}


void update_velocity(quadrangle_t *q, particle_t *p, int N, double dt) {
    double G = 100.0/(double)N;

    double ax, ay, fx, fy, r;
    if(q->leafnode == '0') { //Do have partitions
        r = sqrt( (q->particle->x - p->x)*(q->particle->x - p->x) + (q->particle->y - p->y)*(q->particle->y - p->y) );
        fx = -G * q->particle->m * p->m * (q->particle->x - p->x) / ((r+e)*(r+e)*(r+e));
        fy = -G * q->particle->m * p->m * (q->particle->y - p->y) / ((r+e)*(r+e)*(r+e));
        ax = fx / p->x;
        p->vx = p->vx + ax*dt;
        p->vy = p->vy + ay*dt;
    } else if (threshold_check) { //the box is treated as an equivalent mass
        r = sqrt( (q->xmass - p->x)*(q->xmass - p->x) + (q->ymass - p->y)*(q->ymass - p->y) );
        fx = -G * q->mass * p->m * (q->xmass - p->x) / ((r+e)*(r+e)*(r+e));
        fy = -G * q->mass * p->m * (q->ymass - p->y) / ((r+e)*(r+e)*(r+e));
        ax = fx / p->x;
        ay = fy / p->y;
        p->vx = p->vx + ax*dt;
        p->vy = p->vy + ay*dt;
    } else {
        update_velocity(q->quadrant[0], p, N, dt);
        update_velocity(q->quadrant[1], p, N, dt);
        update_velocity(q->quadrant[2], p, N, dt);
        update_velocity(q->quadrant[3], p, N, dt);
    }
}

void update_positions(particle_t *p, int N, double dt) {
    for(int i=0; i<N; i++) {
        p->x += dt*p->vx;
        p->y += dt*p->vy;
    }
}

void insertparticle(quadrangle_t *q, particle_t *p) {
    int index;
    if (!q) {
        return;
    }
    if (q->leafnode == '1') { //has partitions
        index = get_quadrant_number(q, p);
        insertparticle(q->quadrant[index], p);
            
        q->xmass = ((q->xmass*q->mass)+(p->x*p->m))/(q->mass+p->m);
        q->ymass = ((q->ymass*q->mass)+(p->y*p->m))/(q->mass+p->m);
        q->mass += p->m;
                   
    } else { // Does not have partitions
        if (q->particle != NULL) {
            quadrangle_subdivide(q); //DIVIDE INTO 4 PARTITIONS

            index = get_quadrant_number(q, q->particle); //redirect the old particle
            insertparticle(q->quadrant[index], q->particle);
        
            index = get_quadrant_number(q, p);
            insertparticle(q->quadrant[index], p); //insert the new particle
            
            q->mass = q->particle->m + p->m;
            q->xmass = ( (q->particle->x * q->particle->m) + (p->x*p->m) ) / q->mass;
            q->ymass = ( (q->particle->y * q->particle->m) + (p->y*p->m) ) / q->mass;
            q->particle = NULL;

        } else { 
            q->particle = p;
            q->mass = p->m;
            q->xmass = p->x;
            q->ymass = p->y;
            printf("Created particle: x: %f y: %f in quadrant x:%f y: %f", q->particle->x,q->particle->y, q->originx, q->originy);
        }
    }
}

int get_quadrant_number(quadrangle_t *q, particle_t *p) {
    if( q != NULL) {
        if(p->x < q->originx && p->y > q->originy) { //FIRST
            printf("\nFIRST\n");
            return 0;
        } else if(p->x >= q->originx && p->y >= q->originy) { //SECOND 
            printf("\nSECOND\n");
            return 1;
        } else if( p->x <= q->originx && p->y <= q->originy) { // THIRD
            printf("\nTHIRD\n");
            return 2;
        } else { //FOURTH
            printf("\nFOURTH\n");
            return 3;
        }   
    } else {
        return NULL;
    }
}


void quadrangle_subdivide(quadrangle_t *q){
        printf("Subdivide!\n");
        q->leafnode = '1';
        q->quadrant[0] = quadrangle_init(q->originx-(q->width)/4, q->originy-(q->width)/4, (q->width)/2);
        q->quadrant[1] = quadrangle_init(q->originx+(q->width)/4 ,q->originy+(q->width)/4, (q->width)/2);
        q->quadrant[2] = quadrangle_init(q->originx-(q->width)/4,q->originy-(q->width)/4, (q->width)/2);
        q->quadrant[3] = quadrangle_init(q->originx+(q->width)/4, q->originy-(q->width)/4, (q->width)/2);
}

int read_doubles_from_file(double *storage, int N, const char* filename) {
    // Open input file, display error if faulty execution
    FILE* inputfile = fopen(filename, "rb"); // rb-mode for reading non txt files
    if(!inputfile) {
        printf("Method read_doubles_from_file error: failed to open input file '%s'.\n", filename);
    return -1;
    }
    // Get filesize using fseek() and ftell()
    // move to end of the inputfile (SEEK_END)
    fseek(inputfile, 0L, SEEK_END); 
    //returns the current value of the position indicator (END OF THE FILE)
    size_t fileSize = ftell(inputfile); 
    //fseek() to set file position back to beginning of the file.
    fseek(inputfile, 0L, SEEK_SET); //0l = long int

    // Check if the number of particles specified is less or equal than what exists in the file
    if(fileSize < 6 * N * sizeof(double)) {
        printf("Method read_doubles_from_file error: ");
        printf("Number of particles in the input file '%s' is smaller than the given number of particles n.\n", filename);
    	printf("Not enough particle data in the file specified\n");
    return -1;
    } 

    // Read the whole file
    fread(storage, sizeof(double), 6 * N, inputfile);
    
    // Close the file after successful read
    if(fclose(inputfile) != 0) {
        printf("Method read_doubles_from_file error: error closing input file.\n");
    return -1;
    }

    //Return 0 to indicate success. 
    return 0;
}

int write_result_to_gal(double *storage, int N) {
    // Opening file for writing in binary mode
    FILE* resultHandle = fopen("result.gal", "wb"); // wb-mode for writing non txt files
    if(!resultHandle) {
        printf("Method write_result_to_gal error: failed to open input file result.gal.\n");
    return -1;
    }

    // Writing data to file
    fwrite(storage, sizeof(double), 6*N, resultHandle);

    // Close the file after successful write
    if(fclose(resultHandle) != 0) {
        printf("Method write_result_to_gal error: error closing resultfile.\n");
    return -1;
    }

    //Return 0 to indicate success
    return 0;

}

void print_quadrangle(quadrangle_t *q) {
    if(q->leafnode == '1') {
        print_quadrangle(q->quadrant[0]);
        print_quadrangle(q->quadrant[1]);
        print_quadrangle(q->quadrant[2]);
        print_quadrangle(q->quadrant[3]);
    } else {
        printf("\nQuadrant x: %f y: %f\n", q->originx, q->originy);
    }
    
}

void quadrangle_free(quadrangle_t *node) {
    if (node) {
        quadrangle_free(node->quadrant[0]);
        quadrangle_free(node->quadrant[1]);
        quadrangle_free(node->quadrant[2]);
        quadrangle_free(node->quadrant[3]);
        free(node);
    }
}

int main(int argc, const char* argv[]) {
    if(argc != 7) {
        printf("Give 6 input args: N filename nsteps delta_t graphics\n");
    return -1;
    }
    //Store the initial input data from command line (  KOLLA SÅ ATT N > 1 !)
    const int N = atoi(argv[1]);
    const char* inputfile = argv[2]; 
    const int nsteps = atoi(argv[3]);
    const double dt = atof(argv[4]);
    const double threshold = atof(argv[5]);
    const int graphics = atoi(argv[6]);
    

    printf("Settings:\n");
    printf("Number of particles = %d\n", N);
    printf("Number of timesteps = %d\n", nsteps);
    printf("dt = %f\n", dt);
    printf("graphics = %d\n", graphics);

  // Read file, total file sizee N*6*sizeof(double)
    double buffer1[6*N];

    if(read_doubles_from_file(buffer1, N, inputfile) != 0) {
        printf("Error reading file '%s'\n", inputfile);
    return -1;
    }

    // Creates array of particles
    particle_t *particles = malloc(N*sizeof(particle_t)); 
    for(int i=0; i<6*N; i+=6){
        particles[i/6].x = buffer1[i]; 
        particles[i/6].y = buffer1[i+1]; 
        particles[i/6].m = buffer1[i+2]; 
        particles[i/6].vx = buffer1[i+3]; 
        particles[i/6].vy = buffer1[i+4]; 
        particles[i/6].b = buffer1[i+5]; 
    }

    for(int i = 0; i < N; i++) {   
        printf("p%d: %f %f %f %f %f %f\n", i, particles[i].x, particles[i].y,
                                        particles[i].m, particles[i].vx,
                                        particles[i].vy, particles[i].b); 
    }
 
    
    // CREATE ORIGIN
    double width = 1.0;
    double originx = 0.5;
    double originy = 0.5;

    quadrangle_t *q_root = quadrangle_init(originx, originy, width);
    particle_t *testparticle = malloc(sizeof(particle_t)); 
    testparticle->x = 0.4;
    testparticle->y = 0.3;
    testparticle->m = 1.0;
    testparticle->vx = 5.0;
    testparticle->vy = 0;
    testparticle->b = 3.0;

    //LOOPS OVER ALL PARTICLES --> PARTITION OF THE QUADRANGLES
    
    for(int i=0; i<N; i++) {
        printf("\nPARTICLE %i\n", i);
        insertparticle(q_root, &particles[i]);
    }

    print_quadrangle(q_root);
    
    printf("\n MAIN CHECK MASS \n");
    printf("The mass of root: %f\n", q_root->mass);
    printf("The xmass of root: %f\n", q_root->xmass);
    printf("The ymass of root: %f\n", q_root->ymass);


    //printf("check q_root->quadrant[0]->particle->y: %f\n", q_root->quadrant[0]->particle->y);
    //printf("check q_root->quadrant[1]->particle->y: %f\n", q_root->quadrant[1]->particle->y);



    //printf("\nPARTICLE 4\n");
    //insertparticle(q_root, testparticle);

    //insertparticle(q_root, testparticle);
 

    //printf("check q_root->quadrant[1]->particle->y: %f\n", q_root->quadrant[1]->particle->y);
    //printf("check q_root->quadrant[2]->particle->y: %f\n", q_root->quadrant[2]->particle->y);
    
    //free the allocated memory]->particle->y);]->particle->y);
    
    
    free(particles);
    quadrangle_free(q_root);
    //free(q_root);
    // Write the result into a binary file
    write_result_to_gal(buffer1, N);

    return 0;
}



