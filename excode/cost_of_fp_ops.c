/**
 * Example code trying to measure the relative cost of different
 * arithmetic operations for floating-point numbers; addition,
 * subtraction, multiplication, division.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <math.h>
#include <sys/time.h>

static double get_wall_seconds() {
  struct timeval tv;
  gettimeofday(&tv, NULL);
  double seconds = tv.tv_sec + (double)tv.tv_usec / 1000000;
  return seconds;
}

typedef double float_type;
typedef int int_type;

int main() {
  int i, k, rep;
  const int N = 100;
  float_type arr[N];
  for(i = 0; i < N; i++)
    arr[i] = 1.0000000001+0.0000000001*i;
  int_type arri[N];
  for(i = 0; i < N; i++)
    arri[i] = i % 7 + 1;
  const int M = 4000000;
  float_type result;
  double t;
  int_type resulti;

  int number_of_tests = 5;
  float_type sum_int_add = 0;
  float_type sum_fp_add = 0;
  float_type sum_fp_sub = 0;
  float_type sum_fp_mul = 0;
  float_type sum_fp_div = 0;

  for(rep = 0; rep < number_of_tests; rep++) {

    /* Int addition */
    t = get_wall_seconds();
    resulti = 1;
    for(k = 0; k < M; k++) {
      for(i = 0; i < N; i++) {
	resulti += arri[i];
      }
    }
    sum_int_add += get_wall_seconds() - t;
    printf("Int addition     :  result = %19ld  time taken: %8.3f wall seconds\n", (long int)resulti, get_wall_seconds() - t);

    /* FP addition */
    t = get_wall_seconds();
    result = 1.0;
    for(k = 0; k < M; k++) {
      for(i = 0; i < N; i++) {
	result += arr[i];
      }
    }
    sum_fp_add += get_wall_seconds() - t;
    printf("FP addition      :  result = %19.5f  time taken: %8.3f wall seconds\n", result, get_wall_seconds() - t);

    /* FP subtraction */
    t = get_wall_seconds();
    result = 1.0;
    for(k = 0; k < M; k++) {
      for(i = 0; i < N; i++) {
	result -= arr[i];
      }
    }
    sum_fp_sub += get_wall_seconds() - t;
    printf("FP subtraction   :  result = %19.5f  time taken: %8.3f wall seconds\n", result, get_wall_seconds() - t);

    /* FP multiplication */
    t = get_wall_seconds();
    result = 1.0;
    for(k = 0; k < M; k++) {
      for(i = 0; i < N; i++) {
	result *= arr[i];
      }
    }
    sum_fp_mul += get_wall_seconds() - t;
    printf("FP multiplication:  result = %19.14f  time taken: %8.3f wall seconds\n", result, get_wall_seconds() - t);

    /* FP division */
    t = get_wall_seconds();
    result = 1.0;
    for(k = 0; k < M; k++) {
      for(i = 0; i < N; i++) {
	result /= arr[i];
      }
    }
    sum_fp_div += get_wall_seconds() - t;
    printf("FP division      :  result = %19.14f  time taken: %8.3f wall seconds\n", result, get_wall_seconds() - t);

    printf("-----\n");
  }

printf("Int addition       : avg time taken is %8.3f wall seconds\n", sum_int_add/rep);
printf("FP addition        : avg time taken is %8.3f wall seconds\n", sum_fp_add/rep);
printf("FP subtraction     : avg time taken is %8.3f wall seconds\n", sum_fp_sub/rep);
printf("FP multiplication  : avg time taken is %8.3f wall seconds\n", sum_fp_mul/rep);
printf("FP division        : avg time taken is %8.3f wall seconds\n", sum_fp_div/rep);



  return 0;
}
