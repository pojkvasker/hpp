#include <stdio.h>
#include <stdlib.h>

struct foo1 {
    char *p;			// 8 bytes
    char c;			// 1 byte
};

struct foo2 {
    short s;			// 2 bytes
    char c;			// 1 byte
};

struct foo3 {
    struct foo3inner {
        char *p;		// 8 bytes
        short s;		// 2 bytes
    } __attribute__((__packed__)) inner;
    char c;			// 1 byte
}__attribute__((__packed__));

struct foo4 {
    char *p1;		// 8 bytes
    char *p2;		// 8 bytes
    char c1;		// 1 byte
    char c2;		// 1 byte

};

int main(int argc, char** argv)
{
    printf("normal   : %lu\n",sizeof(struct foo1));
    printf("normal   : %lu\n",sizeof(struct foo2));
    printf("normal   : %lu\n",sizeof(struct foo3));
    printf("normal   : %lu\n",sizeof(struct foo4));
   return 0;
}
