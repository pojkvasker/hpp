#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void assign_string(char *s){
    *s = "Modified";
}

void main(){
    char *s ="hello"
    printf("String before: %s\n", s);
    assign_string(&s);
    printf("String after: %s\n", s);
}