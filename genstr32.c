#include <stdio.h>
//64 BIT
/*przekazujemy wskaźnik do tablicy znaków z c do assemblera. w assemblerze wpisujemy tyle znaków, ile w zmiennej counter.
if inc == 0 then wpisujemy przekazany znak
if inc == 1 then wpisujemy przekazany znak i w kolejnych iteracjach go zwiększamy.
np. (gen_str, 'A', 5, 1) zwróci ABCDE, (gen_str, 'A', 5, 0) AAAAA
*/
extern char* gen_str(char *buf, int start, int count, int inc);

char *gen_str_c(char *buf, int start, int count, int inc) {
  int i;
  for(i = 0; i < count; ++i) {
    buf[i] = (char)start;
    start += inc;
  }

  return buf;
}

int main(void) {
  char buffer_c[100];
  char buffer_asm[100] = "Test";
 
  printf("Wynik C: %s\n", gen_str_c(buffer_c, (int)'A', 5, 1));
  printf("Wynik Asembler: %s\n", gen_str(buffer_asm, (int)'A', 5, 1));
  return 0;
}