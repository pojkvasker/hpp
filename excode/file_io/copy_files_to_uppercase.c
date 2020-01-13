/**
 * Example code reading text data from one file, converting them into the uppercase and writing new data into another file.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *
 */

#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main(int argc, char const *argv[])
{
   if (argc != 3)
   {
      printf("Usage: %s filename_in filename_out\n", argv[0]);
      return -1;
   }
   char filename_in[100]; // assume our file does not contain more than 50 characters
   char filename_out[100];
   strcpy(filename_in, argv[1]);
   strcpy(filename_out, argv[2]);
   FILE *fp1, *fp2;
   char c;

   fp1 = fopen(filename_in, "r");
   fp2 = fopen(filename_out, "w");

   // read one character and convert it
   while ((c = fgetc(fp1)) != EOF)
   {
      c = toupper(c);
      fputc(c, fp2);
   }

   fclose(fp1);
   fclose(fp2);
}
