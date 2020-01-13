/**
 * Example code illustrating array allocation on the stack (static memory allocation).
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


void f()
{
     // memory for the array a is known at the compile time
     // memory is allocated on the stack when function f starts and lives untill the function f ends
    int a[1];
    a[0] = 1;
    printf("In the function f\n");
}


int main()
{
  int N = 3; // array size


  // memory for these arrays is known at the compile time
  // memory is allocated on the stack when program starts and lives untill the program ends (since we are in the main function now)
	int arr_i[N];
	double arr_d[N];
	mystruct_t arr_st[N];

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

  // no need to free memory manually


  // call function f
  f();

	return 0;
}
