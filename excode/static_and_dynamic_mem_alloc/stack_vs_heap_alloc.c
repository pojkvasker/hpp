/**
 * Example of stack vs heap memory allocation.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>

const int N = 1000;

int f1() {
  /* Allocate array "on the heap", i.e. using the malloc() function. */
  /* Note that the argument to malloc() is the size of the memory in
     bytes, so we should take the number of elements we want in the
     array (N) multiplied by the sie of each element (sizeof(int)). */
  int* x = (int*)malloc(N*sizeof(int));

  /* Do some work using x. */
  int i, sum = 0;
  for(i = 0; i < N; i++)
    x[i] = 2*i + 7;
  for(i = 0; i < N; i++)
    sum += x[i];

  /* Since we allocated memory using malloc() it is important to give
     that memory back by calling free(). */
  free(x);

  return sum;
}

int f2() {
  /* Allocate array on the stack. */
  int x[N];

  /* Do some work using x. */
  int i, sum = 0;
  for(i = 0; i < N; i++)
    x[i] = 2*i + 7;
  for(i = 0; i < N; i++)
    sum += x[i];

  return sum;
}

int main(int argc, const char** argv) {
  int sum1 = f1();
  int sum2 = f2();
  printf("sum1 = %d\n", sum1);
  printf("sum2 = %d\n", sum2);
  return 0;
}
