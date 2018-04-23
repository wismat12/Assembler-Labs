#include <stdio.h>
#include <unistd.h>
// 64 BIT
/*int max2(int a, int b)
funkcja max2 dostaje dwie liczby całkowite ze znakiem, i ma zwrócić maksimum z tych trzech liczb: max(a+b, a*b, a-b)
bierzemy 2 parametry, liczymy trzy wyrażenia i zwracamy to które da największy wynik
*/
extern int max2(int a, int b);


int main(int argc, char** argv){
  int ret;
  
  ret = max2(atoi(argv[1]),atoi(argv[2]));

  printf("Wynik: %d \n", ret);
  
  return 0;
}