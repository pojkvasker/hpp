#include <stdio.h>
#include <stdlib.h>
#include "helpfncs.h"

void swap(int *a, int *b){
    int t = *a;
    *a = *b;
    *b = t;
}
void printArray(int *arr,int N){
    for(int i = 0; i < N; i++)
    {
        printf("%d\n",arr[i]);
    }
    printf("end\n");
    
}

int testSort(int *arr, int N){

    for(int i = 0; i < N; i++)
    {
        for(int j=i+1; j<N;j++){
    
        if(arr[i] > arr[j]){
            printf("%i",i);
            return -1;
            }
        }
    }
    return 0; 
}

