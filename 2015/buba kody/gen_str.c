#include <stdio.h>
#include <stdlib.h>
#define SIZE 12

extern char* gen_str(char*s, int c, int n, int inc);

void main(void){
	char* str = malloc((SIZE+1)*sizeof(char));
	int c = 2, inc = 1;
	printf("String:%s\n", gen_str(str, c, SIZE, inc));		
}
