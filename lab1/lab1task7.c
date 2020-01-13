#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void main(){
    double d = 4.2;
    int i = 1;
    char c = 'c';

    double *d_p = &d;
    int *i_p = &i;
    char *c_p = &c;

    printf("Values:\n double: %f\n int: %i\n char: %c\n", d,i,c);
    printf("Addresses:\n double: %p\n int: %p\n char: %p\n",d_p,i_p,c_p);
    printf("Memory size:\n double: %li\n int: %li\n char: %li\n",sizeof(d),sizeof(i),sizeof(c));
}