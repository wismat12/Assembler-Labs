#include <stdio.h>
#include <unistd.h>
//32 bit
/*Funkcja zwraca:
1 jeżeli x>max(a,b)
-1 jeżeli x<min(a,b)
0 jeżeli x>=min(a,b) & x<=max(a,b) (czyli po prostu w innym wypadku)
*/
extern int is_outside(int x, int a, int b);

int main(int argc, char** argv){
int ret;
ret = is_outside(atoi(argv[1]),atoi(argv[2]),atoi(argv[3]));
printf("Wynik: %d \n", ret);
return 0;
}