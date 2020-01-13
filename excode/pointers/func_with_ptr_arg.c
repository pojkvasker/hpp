/**
 * Example code showing how a function can change the value of some
 * variable if the function is given a pointer to that variable.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>

/* The function set_to_five takes a pointer to int as an argument. The
   function changes the value pointed to by setting it to 5. */
void set_to_five(int* p) {
  *p = 5;
}

/* The function increase_by_seven() takes a pointer to an int as an
   input argument. The function changes the value of the variable
   pointed to by 7. */
void increase_by_seven(int* ptr_to_value) {
  *ptr_to_value = *ptr_to_value + 7;
}

int main(int argc, const char** argv) {
  int a;
  a = 33;
  printf("Value of a before function call: %d\n", a);
  set_to_five(&a);
  printf("Value of a after calling set_to_five(): %d\n", a);
  increase_by_seven(&a);
  printf("Value of a after calling increase_by_seven(): %d\n", a);
  return 0;
}
