/**
 * Example of using pointers, getting the address of something using &
 * and dereferencing a pointer using *.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char** argv) {
  /* Create a variable x of type double, with the value 7.4. */
  double x = 7.4;
  double y = 3.5;
  /* Create a pointer to x. */
  double* ptr = &x;
  /* Now we can access the value of x either using x directly, or by
     dereferencing the pointer. */
  printf("value of x (using x directly): %f\n", x);
  printf("value of x (using pointer)   : %f\n", *ptr);
  /* Now we want the pointer to point to y instead. */
  ptr = &y;
  printf("value of y (using y directly): %f\n", y);
  printf("value of y (using pointer)   : %f\n", *ptr);
  /* It is also possible to have a pointer to a pointer. */
  double** ptrToPtr;
  ptrToPtr = &ptr;
  /* Now ptrToPtr points to ptr which points to y. */
  printf("value of y (using pointer to pointer)   : %f\n", **ptrToPtr);
  /* Create another pointer pointing to x. */
  double* ptr2 = &x;
  /* Change ptrToPtr so that it points to ptr2. */
  ptrToPtr = &ptr2;
  printf("value of x (using pointer to pointer)   : %f\n", **ptrToPtr);
  /* A pointer can also be used to change the value of a variable.
     Since ptr2 points to x, we can change the value of x using *ptr2
     like this: */
  *ptr2 = 8.8;

  /* Now we set up an array of 7 int numbers to play with. */
  printf("value of x (using x directly): %f\n", x);
  int arr[7];
  arr[0] = 33;
  arr[1] = 44;
  arr[2] = 11;
  arr[3] =  3;
  arr[4] = -8;
  arr[5] = 12;
  arr[6] = -5;
  /* Print arr values. */
  printf("arr values:\n");
  int i;
  for(i = 0; i < 7; i++)
    printf("%3d ", arr[i]);
  printf("\n");
  /* Create a pointer p and make it point to the beginning of arr. */
  int* p = arr;
  printf("Now p points to %d\n", *p);
  /* Increment p so that it points to the next element in the
     array. */
  p++;
  printf("Now p points to %d\n", *p);
  /* Increment p by 2, moving 2 steps forward in the array. */
  p += 2;
  printf("Now p points to %d\n", *p);
  /* We can also make p point to the place we want by assigning it to
     the address of the array element we want, like this: */
  p = &arr[6];
  printf("Now p points to %d\n", *p);
  int* q = &arr[4];
  printf("Now q points to %d\n", *q);
  /* Now p points to arr[6] and q points to arr[4].  By subtracting
     pointers we can find out how many array elements it is between
     them. */
  int diff = p - q;
  printf("Subtraction pf pointers (p - q) gave diff = %d\n", diff);
  /* We can also use pointers to modify array values, for example like
     this: */
  *p = 7777;
  *q = 8888;
  /* Print arr values again. */
  printf("arr values:\n");
  for(i = 0; i < 7; i++)
    printf("%3d ", arr[i]);
  printf("\n");

  /* A pointer can be seen as an array. For example, we can create a
     pointer called arr2 that points to arr[4]: */
  int* arr2 = &arr[4];
  /* Now arr2 can be used as an array, using part of the same memory
     locations as arr. */
  /* Print arr2 values. */
  printf("arr2 values:\n");
  for(i = 0; i < 3; i++)
    printf("%3d ", arr2[i]);
  printf("\n");
  /* Note that arr and arr2 now use partly the same memory, so if we
     change something in arr2 then a value of arr also changes. */
  arr2[1] = 99;
  printf("arr2 values:\n");
  for(i = 0; i < 3; i++)
    printf("%3d ", arr2[i]);
  printf("\n");
  printf("arr values:\n");
  for(i = 0; i < 7; i++)
    printf("%3d ", arr[i]);
  printf("\n");

  return 0;
}
