/**
 * Example code checking the relative precision of floating-point numbers (machine precision).
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *
 */

#include <stdio.h>
#include <math.h>

typedef double float_type;  // you can change the type otherwise, try float

int main() {

  float_type epsilon = 1;

  // stop if you find such a number that by adding it to 1 you get again 1
  // the last printed number will be an approximation of the machine precision
  while(epsilon + 1 > 1)
  {
     printf("epsilon = %.20g\n", epsilon);
     epsilon *= 0.5;
  }
  return 0;
}
