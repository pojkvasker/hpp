#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void fillMatrix(int *ptr, int size){
    int n = 0;
    for(int x=0; x<size; x++){
        ptr[x] = x;
    }
    printf("%d",ptr);
}

int main(int argc, char* argv[]){
int n = atoi(argv[1]);
int size;
if(n%2 ==0){
    size = n*((n/2)) + n/2;
    printf("size: %d",size);
} else{
    size = n*((n+1)/2);
    printf("size: %d",size);
}
if(argc == 2){
    int *ptr = (int)malloc(size*sizeof(int));

}
return 0;
}