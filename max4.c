#include <stdio.h>
#include <stdlib.h>
//	32 BIT
extern int max4 (int a, int b,int c,int d);
extern int max44 (int a, int b,int c,int d);

int main (int argc, char *argv[])
{
int a = atoi(argv[1]);
int b = atoi(argv[2]);
int c = atoi(argv[3]);
int d = atoi(argv[4]);

  printf("max from:%d,%d,%d,%d is val with nr or zero(more than one max value): %d\n",a,b,c,d, max4(a,b,c,d));
 printf("max from:%d,%d,%d,%d is val with nr or zero(more than one max value): %d\n",a,b,c,d, max44(a,b,c,d));
 

  return 0;
}