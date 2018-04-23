#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char* spaces(char* wsk, int a);

int main()
{
  char* wsk = malloc(100);
  strcpy(wsk, "abc  def   gh ijk");
  //char* wsk = "\0abc  def   gh ijk";
  printf("Przed: %s\n", wsk);
 
  //0 - bez zamiany na duze litery; 1 - zamiana na duze litery
  printf("Po   : %s\n", spaces(wsk, 1));
 
  free(wsk);
  return 0;
}
