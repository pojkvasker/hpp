/**********************************************************************
 * A simple "hello world" program for OpenMP/C
 *
 *
 **********************************************************************/

#include <omp.h>
#include <stdio.h>

int main(int argc, char *argv[]) {

  printf("Starting\n");

#pragma omp parallel 
  {
  for (int i=0; i<omp_get_num_threads(); i++){
  printf("Hello World! %i \n", omp_get_thread_num()); 
  }
  }
  printf("Stopping\n"); 

  return 0;
}
