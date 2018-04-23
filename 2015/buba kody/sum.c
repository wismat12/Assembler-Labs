#include <stdio.h>

extern sum(int x, int y);

void main(int argc, char* argv){
	int a = 3, b=4;
	printf("Suma %d i %d wynosi: %d(asm) == %d(c)\n", a, b, a+b, sum(a,b));
}
