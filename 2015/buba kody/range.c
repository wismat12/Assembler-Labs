#include <stdio.h>

extern int range(int x, int a, int b, int c);

int main(int argc, char** argv){
	if(argc != 5){
		printf("Not enough args!");
		return -1;
	}
	printf("Zwrocona wartosc: %d\n", 
		range(atoi(argv[1]), atoi(argv[2]), atoi(argv[3]), atoi(argv[4])));
}
