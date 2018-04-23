#include <stdio.h>
#include <unistd.h>
// 32 BIT
/*int sum(int a, int b);
Suma liczb od mniejszego z parametrow (a, b) do wiekszego z tych parametrow. Np. Dla 3 i 5 fukcja zwraca 3+4+5
*/
extern int sum(int x, int b);
extern int sum2(int x, int b);

int main(int argc, char** argv){
  int ret, ret2;
  
  ret = sum(atoi(argv[1]),atoi(argv[2]));
  ret2 = sum2(atoi(argv[1]),atoi(argv[2]));
  printf("Wynik: %d \n", ret);
  printf("Wynik: %d \n", ret2);
  
  return 0;
}