/**
 * Example showing how a struct can be used in C code.
 *
 * Course: High Performance Programming, Uppsala University
 *
 * Author: Elias Rudberg <elias.rudberg@it.uu.se>
 *
 */

#include <stdio.h>
#include <stdlib.h>

struct course {
  double numberOfCredits;
  int numberOfStudents;
  int year;
};
typedef struct course course_type;

void print_course_info(course_type* c) {
  printf("-----\n");
  printf("Number of credits: %4.1f\n", c->numberOfCredits);
  printf("Number of students: %d\n", c->numberOfStudents);
  printf("Year: %d\n", c->year);
  printf("-----\n");
}

int main() {
  printf("Setting up course HPP...\n");
  course_type HPP;
  HPP.numberOfCredits = 10;
  HPP.numberOfStudents = 64;
  HPP.year = 2018;
  printf("Setting up course OtherCourse...\n");
  course_type OtherCourse;
  OtherCourse.numberOfCredits = 7.5;
  OtherCourse.numberOfStudents = 115;
  OtherCourse.year = 2018;
  printf("Setting up course OldCourse...\n");
  course_type OldCourse;
  OldCourse.numberOfCredits = 2.5;
  OldCourse.numberOfStudents = 49;
  OldCourse.year = 2009;
  printf("Printing info for HPP:\n");
  print_course_info(&HPP);
  printf("Printing info for OtherCourse:\n");
  print_course_info(&OtherCourse);
  printf("Printing info for OldCourse:\n");
  print_course_info(&OldCourse);
  printf("Done. This is the end of main(). Goodbye!\n");
  return 0;
}
