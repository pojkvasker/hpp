#include <stdio.h>
#include <stdlib.h>
#include <math.h>

void swap_pointers(char *a,char *b){
    char a_temp = *a;
    char b_temp = *b;
    *a = b_temp;
    *b = a_temp;
}

void swap_nums(int *a,int *b){
    int a_temp = *a;
    int b_temp = *b;
    *a = b_temp;
    *b = a_temp;
}

int main()
{
int a,b;
char *s1,*s2;
a = 3; b=4;
swap_nums(&a,&b);
printf("a=%d, b=%d\n", a, b);
s1 = "second"; s2 = "first";
swap_pointers(&s1,&s2);
printf("s1=%s, s2=%s\n", s1, s2);
return 0;
}