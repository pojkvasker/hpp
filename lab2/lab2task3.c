#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void print_int_1(int x) {
printf("Here is the number: %d\n", x);
}
void print_int_2(int x) {
printf("Wow, %d is really an impressive number!\n", x);
}

int main(){
    int n = 6;
    void (*point)(int);

    point = print_int_1;
    (*point)(n);

    point = print_int_2;
    (*point)(n);
    return 0;
}
