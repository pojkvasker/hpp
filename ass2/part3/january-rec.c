#include <stdio.h>
#include <stdlib.h>

typedef struct database_node {
   int index;
   double min, max;
   struct database_node *next; // Ska bara bli en lång raka, kopplas till nästa nod
} database_node_t;

void add_data(database_node_t **, int, double, double);
void print_data(database_node_t *);
void delete_data(database_node_t **);

int main(int argc, char const *argv[]) {
    char c;
    int INDEX;
    double MIN,MAX;
    database_node_t *db_root = NULL;

    do {
        printf("\nEnter command: ");
        scanf("%c", &c);

        if( c == 'A' ) {
            scanf(" %d %lf %lf", &INDEX, &MIN, &MAX);
            add_data(&db_root, INDEX, MIN, MAX);
            printf("%c", c);

        } else if( c == 'P' ) {
            printf("\nday\t min\t\t max\n");
            print_data(db_root);
        } else if( c == 'D' ) {
            delete_data(&db_root);
        } else {
            printf("\n The specified command does not exist. Valid commands A/P/D/Q");
        }

    } while(c != 'Q' );

    return 0;
}

void add_data(database_node_t **node, int INDEX, double MIN, double MAX) {
    if((*node) == NULL) {
        *node = malloc(sizeof(database_node_t));
        (**node).index = INDEX;
        (**node).min = MIN;
        (**node).max = MAX;
        (**node).next = NULL;
        printf("Added: %d %lf %lf", INDEX, MIN, MAX);
    } else if ( (**node).index > INDEX ) { //step until the added node index is larger than current
        database_node_t *newnode = malloc(sizeof(database_node_t));
        (*newnode).index = INDEX;
        (*newnode).min = MIN;
        (*newnode).max = MAX;
        (*newnode).next = (**node).next;
        
        //(**node).next = newnode;
    } else if ( (**node).index < INDEX) {
        add_data( &(**node).next, INDEX, MIN, MAX );
    } else {
        printf("\nNode already exist in the system");   
    }
}

void print_data(database_node_t *node){
    if(node != NULL) {
        printf("%i \t %lf \t %lf \n", (*node).index, (*node).min, (*node).max);
        print_data((*node).next);
    }
}

void delete_data(database_node_t **node) {
    if(*node != NULL){
        delete_data(&(**node).next);
        free(*node);
        *node = NULL;
    }
}