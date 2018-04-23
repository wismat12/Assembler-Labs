#include <stdio.h>

extern int outside(int x, int a, int b);

void main(int argc, char** argv){
	printf("Zwrocona wartosc: %d\n", 
		outside(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]) ) );
}
