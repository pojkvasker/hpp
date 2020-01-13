#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#define NUM_THREADS	5

void *HelloWorld(void *arg)
{
  long thid =(long)arg;
   printf("Hello World! %ld\n", thid);
   pthread_exit(NULL);
}

int main(int argc, char *argv[])
{
pthread_t threads[NUM_THREADS];
long t;
for(t=0;t<NUM_THREADS;t++)
  pthread_create(&threads[t], NULL, HelloWorld, (void *)t);
  pthread_exit(NULL);
}
