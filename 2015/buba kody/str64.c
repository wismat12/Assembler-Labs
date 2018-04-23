#include <stdio.h>
#include <stdlib.h>
#define SIZE 10
extern char* gen(char* buf, int znak, int count, int inc);

void main(void){
    char * buf = malloc((SIZE+1)*sizeof(char));
    printf("String:%s...\n" , gen(buf, 'A', SIZE, 1));
}
