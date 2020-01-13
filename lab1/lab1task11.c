#include <stdio.h>
#include <stdlib.h>
#include <math.h>

struct product{
    char name[50];
    double price;
};
typedef struct product product_t;

int main(int argc, const char* argv[]){
char const* const file_name = argv[1];
char ch, str[256], name[51];
int i = 0;
int size;
double price;

FILE *f = fopen(file_name, "r");
fgets(str, sizeof(str), f);
struct product object[size];

while(fscanf(f,"%s %le", name, &price) != EOF){
    strcpy(object[i].name, str);
    object[i].price = price;
    ++i;
}
printf("Cost of last product: %f\n", price);
printf("Name of last product: %s\n", name);
fclose(f);
return 0;
}
