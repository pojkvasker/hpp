/**
 * Read characters into an array untill characters 'Q' or 'q' are encountered.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>

int main()
{
   char c;
   int size_add = 10; // initial array size
   char *arr = (char *)malloc(size_add * sizeof(char)); // create an array with length 10
   int size = 10, count = 0;

   while (scanf(" %c", &c) == 1 && c != 'Q' && c != 'q')
   {
      arr[count] = c;
      count++;
      // check if the array size should be increased
      // if yes, add space for size_add more elements
      if (count % size_add == 0)
      {
         size += size_add;
         arr   = (char *)realloc(arr, size * sizeof(char));
      }
   }

   // shrink the array if needed
   if(size != count)
   {
       arr = (char *)realloc(arr, count * sizeof(char));
       size = count;
   }

   for (int j = 0; j < size; ++j)
   {
      printf("%c ", arr[j]);
   }
   printf("\n");
   free(arr);

   return 0;
}
