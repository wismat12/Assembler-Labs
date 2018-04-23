#include <stdio.h>
#define SIZE 12

extern int greatest(int a, int b, int c);
extern char* gen_str(char*s, int c, int n, int inc);

void main(void){
	int a = 10, b = -7, c=3;
	char str[SIZE]
	printf("Max equals: %d\n", greatest(a,b,c) );
	int n = SIZE, c = 2;
	printf("%s", gen_str(str, c, SIZE, 0));	
}
