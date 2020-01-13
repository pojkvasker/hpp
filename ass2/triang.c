#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[]){
        int n = atoi(argv[1]); /*Columns*/
        for(int j = 0; j <n; j++){ /*Rows*/
            int a = 1;
            printf("%i", a);
            for(int i = 1; i <=j; i++){ /*Cols*/
                a = a*(j+1-i)/i;
                printf("%i",a);

            }
        printf("\n");
        }
    return 0;
}