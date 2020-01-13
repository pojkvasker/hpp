#include <stdio.h>
#include <sys/time.h>
/*
struct timeval{
  time_t tv_sec; 
  suseconds_t tv_usec;
};
struct timezone {
  int tz_minuteswest; 
  int tz_dsttime; 
};
*/
struct timeval start, end;

int main() {
  int k;
  double d = 1.0;
  gettimeofday(&start, NULL);
  for(k = 0; k < 500000000; k++)
    {
      d *= 1.0000000000001;
    }
  gettimeofday(&end, NULL);
  printf("%20.13f\n", d);
  //double seconds = ((end.tv_sec + (double)end.tv_usec/1000000) - (start.tv_sec + (double)start.tv_usec/1000000));
  //printf("%ld\n", seconds);
  printf("%lf\n", ((end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec)/1e6));
  return 0;
}
