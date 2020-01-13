/**
 * Sort strings in the alphabetical order using qsort. Check qsort at  https://en.cppreference.com/w/c/algorithm/qsort
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Anastasia Kruchinina <anastasia.kruchinina@it.uu.se>
 *
 */

#include <string.h>
#include <stdio.h>
#include <stdlib.h>

// compare two strings
int CmpString(const void * p1, const void *p2)
{
char *str1 = *(char **)p1;
char *str2 = *(char **)p2;
return strcmp(str1, str2); // return values are -1, 0 or 1
}


int main() {
    int i;

    char *arrStr[] = {"daa", "cbab", "bbbb", "bababa", "ccccc", "aaaa"};

    // get array length as (total number of bytes in array)/(size of one element)
    int arrStrLen = sizeof(arrStr) / sizeof(char *);

    int (*fnptr)(const void *,const void *); // define a function pointer
    fnptr = &CmpString; // or fnptr = CmpString
    qsort(arrStr, arrStrLen, sizeof(char *), fnptr);
    //   or
    //qsort(arrStr, arrStrLen, sizeof(char *), &CmpString);
    //   or
    //qsort(arrStr, arrStrLen, sizeof(char *), CmpString);

    for (i=0; i<arrStrLen; ++i)
        printf("%d: %s\n", i, arrStr[i]);

return 0;
}
