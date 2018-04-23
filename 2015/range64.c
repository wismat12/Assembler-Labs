#include <stdio.h>
#include <unistd.h>
// 64 BIT
/*int range (int x, int a, int b, int c)
zawsze a<b<c
Zwraca 0 gdy x <a
1 gdy x >=a i x <b
2 gdy x >= b i x< c
3 gdy x >= c
*/
extern int range(int x, int a, int b, int c);


int main(int argc, char** argv){
  int ret;
  
  ret = range(1,1,2,3);

  printf("Wynik: %d \n", ret);
  
  return 0;
}