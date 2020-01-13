#include <stdio.h>
#include <stdlib.h>


typedef struct temp{
    int index;
    double min;
    double max;
    struct temp *left;
    struct temp *right;
} temp_t;


int main(){
    char c;
    int index;
    double min, max;
    temp_t *db_root = NULL;
    do{
        printf("Enter command: ");
        scanf("%s", &c);
        if(c == 'A'){
            scanf(" %i %lf %lf", &index, &min, &max);
            printf("Added %i %lf %lf\n", index, min, max);
            insert(&db_root,index, min, max);
        }else if(c == 'D'){
            delete(&db_root);
        }else if(c == 'P'){
            if(&db_root == NULL){
                printf("Empty database \n");
            }
            print(db_root);
        }else{
            printf("Faulty command\n");
        }
     }while (c != 'Q');
return 0;
}


void insert(temp_t **node, int index, double min, double max)
{
  if(*node == NULL){
  *node = malloc(sizeof(temp_t));
  (**node).index = index;
  (**node).min = min;
  (**node).max = max;
  (**node).left = NULL;
  (**node).right = NULL;
  
  } else if((**node).index < index){
    insert(&(**node).right, index, min, max);
  }
  else if((**node).index > index){
    insert(&(**node).left, index, min, max);
  }
  else{
    printf("index already exists!\n");
  }
}

void delete(temp_t **node)
{
 if(*node != NULL){
   delete(&(**node).left);
   delete(&(**node).right);
   free(*node);
   *node = NULL;
 }
}
void print(temp_t *node){
    if(node != NULL){
    print(&(*node).left);
    printf("%i \t %lf \t %lf \n", (*node).index, (*node).min, (*node).max);
    print(&(*node).right);
    }
}