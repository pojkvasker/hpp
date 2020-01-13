#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>
#include "helpfncs.h"
#include <omp.h>


struct timeval t0,t1;

unsigned int partition(int *arr,int low, int high){
    int p = arr[high]; // choose the last element as the pivot
    int backIndex = low - 1;
    for(int i = low; i < high; i++) //Iterate over entire array
    {
        if(arr[i]<=p){  //pivot element is greater than element
            backIndex++;
            swap(&arr[backIndex],&arr[i]);
        }
    }
    backIndex++;
    swap(&arr[backIndex],&arr[high]);
    //Array should be partioned, backIndex is where the pivotelement is
    return backIndex;
}


void quickSort(int *arr, int low, int high){
    //Choose pivot as the last element in the array
    if (low<high){ // only two elements in the array //find where the serial part is more efficient and make an if statement
        unsigned int pivotI = partition(arr,low,high);
        if(high-low<100000){            //checks the cutoff if it is worth using threads    
            quickSort(arr,low,pivotI-1);
            quickSort(arr,pivotI+1,high);
        } 
        else{             
            #pragma omp task default(none) firstprivate(arr,low,pivotI)
            {
                quickSort(arr,low,pivotI-1);
            }
            #pragma omp task default(none) firstprivate(arr,high,pivotI)
            {
                quickSort(arr,pivotI+1,high);
            }
        }
    }
    
}

int main(int argc, char *  argv[]){
    //Initialize n
    if(argc != 4 ){
        printf("Give two inputs, size, cap\n");
        return 0;
    }
    int n = atoi(argv[1]);  //
    int cap = atoi(argv[2]);
    int *arr = malloc(n*sizeof(int));
    int n_threads = atoi(argv[3]);
    for(int i = 0; i < n; i++) //initialize the array with random numbers
    {
        arr[i] = (int) (rand()/ ((int) (RAND_MAX/cap)));
        // arr[i] = i;
    }
    gettimeofday(&t0,NULL);

    omp_set_num_threads(n_threads);

    #pragma omp parallel default(none) shared(arr,n)
    {
        #pragma omp single nowait
        {
            quickSort(arr,0,n-1);
        }
    }
    gettimeofday(&t1,NULL);
    double eTime = (t1.tv_sec-t0.tv_sec) +(t1.tv_usec-t0.tv_usec)/1e6;

    // if(testSort(arr,n)==-1){
    //     printf("Sort not working\n");
    // }    
    // else{
    //     printf("Sort Working\n");
    // }

    printf("Elapsed time for sort: %lf \n",eTime);
    free(arr);


    return 0;
}