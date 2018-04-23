#include <stdio.h>

extern int sumRange(int a, int b);

int main(int argc, char** argv){
	if(argc != 3){
		printf("Not enough args!\n");
		return -1;
	}
	printf("Zwrocona wartosc: %d\n", 
		sumRange(atoi(argv[1]), atoi(argv[2])));
}
