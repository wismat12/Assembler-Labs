#include <stdio.h>
#include <stdlib.h>
#define SIZE 4
extern int suma(int * tab, int size);

int main(int argc, char** argv){
	int i,j;
	int tab[SIZE*SIZE];
	for(i=0;i<SIZE;i++)
		for(j=0;j<SIZE;j++)
			tab[i*SIZE+j] = i*SIZE+j;

	for(i=0;i<SIZE;i++){
		for(j=0;j<SIZE;j++)
			printf("%d ", tab[i*SIZE+j]);
		printf("\n");
	}
	printf("suma el. na przekatnej: %d\n", suma(tab, SIZE));

	return 0;
}
