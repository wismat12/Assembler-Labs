#include <stdio.h>
//	32 BIT
extern long max_diff(long, long, long, long);

int main(int argc, char **argv) {
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);
  int c = atoi(argv[3]);
  int d = atoi(argv[4]);
  printf("Roznica max i min zbioru (%d,%d,%d,%d) wynosi: %li\n",a,b,c,d,max_diff(a,b,c,d));
  return 0;
}