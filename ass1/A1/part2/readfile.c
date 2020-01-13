#include <stdio.h>
#include <stdlib.h>

struct fileinfo{
    int i;
    double d;
    char c;
    float f;
};
typedef struct fileinfo fileinfo_t;

int main(){
    FILE *f = fopen("little_bin_file", "r");

    if(f == NULL){
        printf("ERROR");
        exit(1);
    }else{
        fileinfo_t *intel = malloc(sizeof(fileinfo_t));

        while(fread(intel, sizeof(fileinfo_t),17,f)){

        printf("Int: %i\n",(*intel).i);
        printf("Double: %d\n",(*intel).d);
        printf("Int: %s\n",(*intel).c);
        printf("Int: %f2.3\n",(*intel).f);

        fclose(f);
        }
    }

}