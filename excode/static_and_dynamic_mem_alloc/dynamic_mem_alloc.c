/**
 * Example code illustrating array allocation on the heap (dynamic memory allocation).
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *
 */


#include <stdio.h>
#include <stdlib.h>


struct mystruct
{
	int a;
	double b[2];
};
typedef struct mystruct mystruct_t;


void allocate_memory(int **a, double **b, mystruct_t ** c, int N)
{
   *a = (int *)malloc(sizeof(int)*N);
	 *b = (double *)malloc(sizeof(double)*N);
	 *c = (mystruct_t *)malloc(sizeof(mystruct_t)*N);
}

void free_memory(void *arr) // the type of elements does not matter here
{
	free(arr);
}



int main()
{
  int N = 3; // array size

	int *arr_i = NULL;
	double *arr_d = NULL;
	mystruct_t *arr_st = NULL;

  // we assign memory using malloc inside the function
	// we want to change the value of the pointer itself, so we need to provide its address to the function
	allocate_memory(&arr_i, &arr_d, &arr_st, N);

  // assign some values
	for (size_t i = 0; i < N; i++) {
		arr_i[i] = i; arr_d[i] = i;
		arr_st[i].a = i+1;
		// note the cast to double below, otherwise we get integer division
		arr_st[i].b[0] = (double)i/2; arr_st[i].b[1] = (double)i/3;
	}

  printf("arr_i: ");
	for (size_t i = 0; i < N; i++) {
		printf("%d  ", arr_i[i]);
	}
	printf("\n");

	printf("arr_d: ");
	for (size_t i = 0; i < N; i++) {
		printf("%.2lf  ", arr_d[i]);
	}
	printf("\n");

	printf("arr_st: ");
	for (size_t i = 0; i < N; i++) {
		printf("(a=%d, b[0]=%.2lf, b[1]=%.2lf )   ",
					arr_st[i].a, arr_st[i].b[0], arr_st[i].b[1]);
	}
	printf("\n");

  free_memory(arr_i);
	free_memory(arr_d);
	free_memory(arr_st);

	return 0;
}
