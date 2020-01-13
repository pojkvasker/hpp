#include <stdlib.h>
#include <stdio.h>
#include <math.h>

// To access the simulation methods
#include "graphics.h"


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

//skapa en loop över tiden utanför denna, buffer1=p kommer byta värden vid varje tidsstegmake
void computations(double p[], int N, double dt) {
    const double G = (double)100/N; //Skapa en fil där denna skapas #define G = blabla
    const double e = 1e-3;
    double Fx, Fy, ay, ax, rvecx, rvecy, r;
   
    //printf("N: %d\n", N);
    double *newtonx = (double*)calloc(N, sizeof(double));
    double *newtony = (double*)calloc(N, sizeof(double));

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

    free(newtonx);
    free(newtony);
    
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
    double dt = atof(argv[4]);
    const int graphics = atoi(argv[5]);

    // PROBLEM SETTING dt = 1e-5
    //dt = 1e-5;

    printf("Settings:\n");
    printf("Number of particles = %d\n", N);
    printf("Number of timesteps = %d\n", nsteps);
    printf("dt = %f\n", dt);
    printf("graphics = %d\n", graphics);

  // Read file, total file size N*6*sizeof(double)
    double buffer1[6*N];
    
    if(read_doubles_from_file(buffer1, N, inputfile) != 0) {
        printf("Error reading file '%s'\n", inputfile);
    return -1;
    }
        printf("p0: %f %f %f %f %f %f \n %f %f %f %f %f %f\n", buffer1[0], buffer1[1],
                                    buffer1[2], buffer1[3],
                                    buffer1[4], buffer1[5],
                                    buffer1[6], buffer1[7],
                                    buffer1[8], buffer1[9],
                                    buffer1[10], buffer1[11]);


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
            computations(buffer1, N, dt); 
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
            computations(buffer1, N, dt); 
            step++; 
        }
    }

    // Write the result into a binary file
    write_result_to_gal(buffer1, N);

    return 0;
}

