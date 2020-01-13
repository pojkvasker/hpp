/**
 * Example of file input/output (IO): reading and writing files using
 * the functions fopen(), fread(), fwrite(), and flose(). The program
 * reads a file into memory, performs a replacement of the character
 * 'a' --> 'X', and then writes the result to another file.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, const char** argv) {
  if(argc != 3) {
    printf("Please give two arguments: input_file_name output_file_name\n");
    return -1;
  }
  const char* input_file_name = argv[1];
  const char* output_file_name = argv[2];
  printf("input_file_name = %s\n", input_file_name);
  printf("output_file_name = %s\n", output_file_name);
  /* Open input file and determine its size. */
  FILE* input_file = fopen(input_file_name, "rb");
  if(!input_file) {
    printf("Error: failed to open input file '%s'.\n", input_file_name);
    return -1;
  }
  /* Get filesize using fseek() and ftell(). */
  fseek(input_file, 0L, SEEK_END);
  size_t fileSize = ftell(input_file);
  /* Now use fseek() again to set file position back to beginning of the file. */
  fseek(input_file, 0L, SEEK_SET);
  printf("fileSize = %lu bytes.\n", fileSize);
  /* Allocate buffer into which we can then read the data from input_file. */
  char* buffer = (char*)malloc(fileSize*sizeof(char));
  /* Read contents of input_file into buffer. */
  size_t noOfItemsRead = fread(buffer, sizeof(char), fileSize, input_file);
  if(noOfItemsRead != fileSize) {
    printf("Error: failed to read file contents into buffer.\n");
    return -1;
  }
  /* OK, now we have the file contents in the buffer.
     Since we are finished with the input file, we can close it now. */
  if(fclose(input_file) != 0) {
    printf("Error closing input file.\n");
    return -1;
  }
  /* Go through buffer and perform the replacement 'a' --> 'X'. */
  size_t replacementCount = 0;
  size_t i;
  for(i = 0; i < fileSize; i++) {
    if(buffer[i] == 'a') {
      buffer[i] = 'X';
      replacementCount++;
    }
  }
  printf("Replaced %lu characters in the buffer.\n", replacementCount);
  /* OK, now we have modified the contents of the buffer. Now write it to the output file.
     First open the file using fopen(). */
  FILE* output_file = fopen(output_file_name, "wb");
  if(!output_file) {
    printf("Error opening output file '%s'.\n", output_file_name);
    return -1;
  }
  /* Now write to the file using fwrite(). */
  size_t noOfItemsWritten = fwrite(buffer, sizeof(char), fileSize, output_file);
  if(noOfItemsWritten != fileSize) {
    printf("Error: failed to write buffer contents to output file.\n");
    return -1;
  }
  /* OK, we have successfully written to the output file. Now close it. */
  if(fclose(output_file) != 0) {
    printf("Error closing output file.\n");
    return -1;
  }
  /* OK, everything is done.
     Print a happy message to the user and then return 0 to indicate success. */
  printf("Finished OK!\n");
  return 0;
}
