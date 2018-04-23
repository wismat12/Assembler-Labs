#include <stdio.h>
#include <stdlib.h>

extern char *usun_spacje(char *, int);
extern char *usun_spacje2(char *, int);
int main()
{
  char* wsk = malloc(100);
  char* wsk2 = malloc(100);
  sprintf(wsk, "%s", "abc  def   gh ijk");
  sprintf(wsk2, "%s", "abc  def   gh ijk");
  printf("%s\n", wsk);
 
  //0 - bez zamiany na duze litery; 1 - zamiana na duze litery
  printf("%s  wsk:%s\n", usun_spacje(wsk, 1),wsk);
  printf("%s  wsk:%s", usun_spacje2(wsk2, 1),wsk2);
 
  free(wsk);
  free(wsk2);
  return 0;
}