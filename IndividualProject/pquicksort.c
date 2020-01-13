#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <time.h>
#include "helpfncs.h"
#include <pthread.h>
#define NUM_THREADS 8
struct timeval t0,t1;

typedef struct inpt{
    int *arr;
    int low,high;
}inputstruct;


int iterations=0;
pthread_t tid[NUM_THREADS];
void *qSort(void *arg);
void quickSort(int *arr,int low, int high);

int partition(int *arr,int low, int high){
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

void *qSort(void *arg){
    inputstruct *temp = (inputstruct*) arg;
    int high = temp->high;
    int *arr = temp->arr;
    int low = temp->low;
    int p = partition(arr,low,high);
    quickSort(arr,low,p-1);
    quickSort(arr,p+1,high);
}


void quickSort(int *arr, int low, int high){

    if (low<high){                              // only two elements in the array
        iterations++;
        if (NUM_THREADS > iterations){                          // If we have called quicksort more times than 
            inputstruct *temp = malloc(sizeof(inputstruct));  // there are threads let the threads run recurvsively
            temp->arr = arr;
            temp->high = high;
            temp->low = low;
            pthread_create(&tid[iterations],NULL,qSort,temp);                                                  
            
        }else                           //More iterations than threads 
        {
            int pivotI = partition(arr,low,high);
            quickSort(arr,low,pivotI-1);
            quickSort(arr,pivotI+1,high);
        }
    }

    
}

int main(int argc, char *  argv[]){
    //Initialize n
    if(argc != 3 ){
        printf("Give two inputs, size, cap\n");
        return 0;
    }
    int n = atoi(argv[1]);  //
    int cap = atoi(argv[2]);
    int *arr = malloc(n*sizeof(int));
    for(int i = 0; i < n; i++) //initialize the array with random numbers
    {
        arr[i] = (int) (rand()/ ((int) (RAND_MAX/cap)));
        // arr[i] = i;
    }
    // printArray(arr,n);
    gettimeofday(&t0,NULL);

    inputstruct *temp = malloc(NUM_THREADS*sizeof(inputstruct));
    quickSort(arr,0,n-1);
   
    for(int i = 0; i < NUM_THREADS; i++)
    {
        pthread_join(tid[i],NULL);
    }
    gettimeofday(&t1,NULL);
    double eTime = (t1.tv_sec-t0.tv_sec) +(t1.tv_usec-t0.tv_usec)/1e6;

    // printArray(arr,n);

    // if(testSort(arr,n)==-1){
    //     printf("Sort not working\n");
    // }    
    // else{
    //     printf("Sort Working\n");
    // }

    // printf("Number of iteraions: %i \n", iterations);
    free(arr);
    

    printf("Elapsed time for sort: %lf \n",eTime);

    return 0;
}