#include <stdio.h>
#include <stdlib.h>

struct fileinfo{
    int i;
    double d;
    char c;
    float fl;
};
typedef struct fileinfo fileinfo_t;

int main(){
    FILE *f = fopen("little_bin_file", "r");

    if(f == NULL){
        printf("ERROR");
        exit(1);
    }else{
        fileinfo_t *intel = malloc(sizeof(fileinfo_t));

        fread(intel, sizeof(fileinfo_t),1,f);

        printf("Int: %i\n",(*intel).i);
        printf("Double: %f\n",(*intel).d);
        printf("Char: %c\n",(*intel).c);
        printf("float: %lf\n",(*intel).fl);

        fclose(f);
        
    }

}