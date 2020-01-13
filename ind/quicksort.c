#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>
#include <time.h>

void swap(int *ptr1,int *ptr2){
    //creating local dummy variables
    int a1 = *ptr1;
    int a2 = *ptr2;
    *ptr1 = a2;
    *ptr2 = a1;

}
bool compare(int *ptr1, int *ptr2){
    //only used for testing
    //checking if ptr1 is smaller or equal to ptr2
    if(ptr1<=ptr2){
        return true;
    }else{
        return false;
    }
}

bool check(int arr[], int size){
    //Only used for testing
    for(int i=0; i<size; i++){
        for(int j=i+1; j<size-1; j++){
            if(!compare(&arr[i],&arr[j])){
                return false;
            }
        }
    }
    return true;
}

void arrprint(int arr[], int size){
    //visual representation
    //only used for testing small arrays
    for(int i=0; i<size; i++){
        printf("%d \n",arr[i]);
    } printf("-- \n");
}

int part(int arr[], int min, int max){
    int piv = arr[min]; //pivot chosen as the first element in the given array
    int index = min;
    for(int i=min+1; i<=max; i++){
        if(arr[i]<=piv){ //elements of equal signs are managed as the smaller
            index++; //increment index and swap
            swap(&arr[index],&arr[i]);
        }
    }
    swap(&arr[min],&arr[index]); //put pivot in the middle
    return index; //returning the split-index
}

void quicksort(int arr[], int min, int max){
    if(min<max){
        int piv = part(arr, min, max); //recieving the split-index
        quicksort(arr, min, piv-1); //sub-array smaller than pivot
        quicksort(arr, piv+1, max); //sub-array bigger than pivot
    }
}

int main(int argc, const char* argv[]){
     if(argc != 3) {
        printf("Give 2 input args: size of unsorted array and largest element size\n");
        return -1;
    }
    int size = atoi(argv[1]); //size of unsorted array
    int maxsize = atoi(argv[2]); //maximal element size
    int *arr = malloc(size*sizeof(int)); 
    //randomly generating an array of given size and max element size
    for(int i=0; i<size; i++){
        arr[i] = (int)(rand() / ((int)(RAND_MAX/maxsize)));
    }
    clock_t time;
    time = clock();
    quicksort(arr, 0, size-1);
    time = clock()-time;
    double timetaken = ((double)time)/CLOCKS_PER_SEC;
    printf("%d  %lf\n",size,timetaken);
    /*
    if(check(arr,size)){
        printf("Quicksort sucessfully completed!\n");
    }else{
        printf("Quicksort malfunction!\n");
    }
    */
    free(arr);
    return 0;
}


