#include <stdio.h>
#include <stdlib.h>
// 	64 BIT Łączenie 2 stringów, działa dla nierównej długości stringów.
extern char *combine_str(char *buf, char* a, char* b);

char *combine_str_c(char *buf, char* a, char* b) {
  char *t = buf;
  for(; *a != '\0' && *b != '\0'; ++a, ++b) {
    *(t++) = *a;
    *(t++) = *b;
  }
  *t = '\0';

  return buf;
}

int main(void) {
  char a[] = "abcdefgijk", b[] = "1234";
  
  char *buf_c = malloc(100 * sizeof(char));
  
  char *buf_asm= malloc(100 * sizeof(char));
  
  printf(" %d\n", sizeof(char));
  printf("Wynik C: %s\n", combine_str_c(buf_c, a, b));
  
  printf("Wynik Asm: %s\n", combine_str(buf_asm, a, b));

  free(buf_c); 
  free(buf_asm); 
  return 0;
}
