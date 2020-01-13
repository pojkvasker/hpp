/**
 * Example of file input/output (IO): reading and writing text files. Let input file
 * contains the following pieces of data: integer, character, string and double. For example:
 * 4
 * A
 * hello
 * 4.3
 * 
 * The program reads the input file and copies its content to the output file.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
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

        FILE *fp1 = fopen(input_file_name, "r"); // open file for reading
        FILE *fp2 = fopen(output_file_name, "w"); // open file for writing

        char c;
        char str[50];
        int n;
        double d;

        fscanf(fp1, "%d", &n);  // read integer
        fscanf(fp1, " %c", &c);  // read character
        fscanf(fp1, "%s", str);  // read string NOTE: we do not provide address of str since str is already a pointer to the first element of the array str
        fscanf(fp1, "%lf", &d);  // read double

         // write data from buff to the file fp2
        fprintf(fp2, "%d", n);  // write integer
	fprintf(fp2, "\n");  // write new line
        fprintf(fp2, "%c", c);  // write character 
	fprintf(fp2, "\n");  // write new line
        fprintf(fp2, "%s", str);  // write string
	fprintf(fp2, "\n");  // write new line
        fprintf(fp2, "%.3lf", d);  // write double

        // close files
        fclose(fp1);
        fclose(fp2);
        return 0;
}
