#include <stdlib.h>
#include <stdio.h>
#include <math.h>

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
    struct quadrangle *first;
    struct quadrangle *second;
    struct quadrangle *third;
    struct quadrangle *fourth;

} quadrangle_t;



//void insertparticle(particle_t *p, quadrangle_t *q) {
//    if( p.x == )
//}

//int i = 0;
//void computations(double p[], int N, double dt, int i) {
//    const double G = 100.0/(double)N; //Skapa en fil där denna skapas #define G = blabla
    //const double e = 1e-3;
 //   double Fx, Fy, ay, ax, rvecx, rvecy, r;

//    computations(double p[i+6], partikeln, windowsize, int i)
//    i+=6;
//}
int read_doubles_from_file(double storage, int N, const char filename) {
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

void create_particles(double []b, int N) {
    for(int i=0; i<N, i++) {
        particle_t p* = malloc(N*sizeof(particle_t))
        for(int j=0; j<N*6; j+=6) {
            (*p[j]).x = b
        }
    }
}

int main(int argc, const char* argv[]) {
    if(argc != 6) {
        printf("Give 5 input args: N filename nsteps delta_t graphics\n");
    return -1;
    }
    //Store the initial input data from command line (  KOLLA SÅ ATT N > 1 !)
    const int N = atoi(argv[1]);
    const char* inputfile = argv[2]; 
    const int nsteps = atoi(argv[3]);
    const double dt = atof(argv[4]);
    const int graphics = atoi(argv[5]);

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

    printf("p1: %f %f %f %f %f %f\n", particles[0].x, particles[0].y,
                                    particles[0].m, particles[0].vx,
                                    particles[0].vx, particles[0].b);

    // call on create particles
    particle_t *root = NULL;

    //init quadrangle
    
  

    // Write the result into a binary file
    write_result_to_gal(buffer1, N);

    return 0;
}



/*
//skapa en loop över tiden utanför denna, buffer1=p kommer byta värden vid varje tidsstegmake
void computations(double p[], int N, double dt) {
    const double G = 100.0/(double)N; //Skapa en fil där denna skapas #define G = blabla
    //const double e = 1e-3;
    double Fx, Fy, ay, ax, rvecx, rvecy, r;
   
    //printf("N: %d\n", N);
    double newtonx = (double)calloc(N, sizeof(double));
    double newtony = (double)calloc(N, sizeof(double));

    // Loop over each particle
    for(int i = 0; i < 6*N; i+=6) {
        Fx = 0; //need only to reset these two, other gets overwritten in each iteration
        Fy = 0;
    
        for(int j = i+6; j < 6*N; j+=6) { //N particles
            //r = sqrt( pow((p[i]-p[j]),2) + pow((p[i+1]-p[j+1]),2) );
            r = (double)sqrt( (p[i]-p[j])*(p[i]-p[j]) + (p[i+1]-p[j+1])*(p[i+1]-p[j+1]) );
            rvecx = p[i] - p[j]; 
            rvecy = p[i+1] - p[j+1];

            // Räknar inte tidigare partiklar
            Fx += (p[j+2] / ((r+e)*(r+e)*(r+e)) ) * rvecx;
            Fy += (p[j+2] / ((r+e)*(r+e)*(r+e)) ) * rvecy;

            // The opposite force on the jth particle from the ith particle
            newtonx[j/6] -= -G * p[i+2] * (p[j+2] / ((r+e)*(r+e)*(r+e)) ) * rvecx;
            newtony[j/6] -= -G * p[i+2] * (p[j+2] / ((r+e)*(r+e)*(r+e)) ) * rvecy;
        } 

    Fx = (Fx * -G * p[i+2]) + newtonx[i/6];
    Fy = (Fy * -G * p[i+2]) + newtony[i/6];

    // Symplectic Euler (time stepping)
    ax = Fx / p[i+2];
    ay = Fy / p[i+2];

    p[i+3] = p[i+3] + (dt * ax); //velocity x update
    p[i+4] = p[i+4] + (dt * ay); //velocity y update
    p[i] = p[i] + (dt * p[i+3]); // position x update
    p[i+1] = p[i+1] + (dt * p[i+4]); // position y update

    }
    //free the allocated memory
    free(newtonx);
    free(newtony);
    
}
*/


/*
  // Computes the time stepping for each particle 
    int step = 0;
    if( graphics == 1 ) {
        // SIMULATION VARIABLES
        float L=1, W=1;
        const float circleRadius = 0.003, circleColor = 0;
        const int windowWidth = 800;

        InitializeGraphics(argv[0], windowWidth, windowWidth);
        SetCAxes(0,1);

        printf("Hit q to quit.\n");
        while( step < nsteps ) {
            // Positions and velocities are changed in buffer within each loop
            //computations(buffer1, N, dt); 
            step++;

            //Call graphics routines SIMULATE
            ClearScreen();
            for(int k=0; k < N*6; k+=6) {
                DrawCircle(buffer1[k], buffer1[k+1], L, W, circleRadius, circleColor);
            }
            Refresh();
            //Sleep a short while to avoid screen flickering. 
            usleep(3000);
        }
    FlushDisplay();
    CloseDisplay();
    } else {
        while ( step < nsteps ) {
            // Positions and velocities are changed in buffer within each loop
            //computations(buffer1, N, dt); 
            step++; 
        }
    }
    */