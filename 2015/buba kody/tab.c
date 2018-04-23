#include <stdio.h>
#include <stdlib.h>

extern int suma(int ** tab, int bok);

int main(int argc, char** argv){
	if(argc != 2){
		printf("Wrong nr of args.\n");
		return -1;
	}
	int bok = atoi(argv[1]), i, j;
	int ** tab = malloc(bok*sizeof(int*));
	for(i=0;i<bok;i++)
		tab[i] = malloc(bok*sizeof(int));

	for(i=0;i<bok;i++)
		for(j=0;j<bok;j++)
			tab[i][j] = i*bok+j;

	for(i=0;i<bok;i++){

		for(j=0;j<bok;j++)
			printf("%d ", tab[i][j]);
		printf("\n");
	}
	printf("suma el. na przekatnej: %d\n", suma(tab, bok));

	for(i=0;i<bok;i++)
		free(tab[i]);

	free(tab);
	return 0;
}
