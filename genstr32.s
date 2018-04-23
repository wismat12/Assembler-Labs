.data
   
   .text

   .type gen_str, @function
   .globl gen_str
#TUTAJ DZIALA POCZATKOWE WCZYTANIE WSKAZNIKA DO EAX
#// Funkcja char* gen_str(char *buf, int start, int count, int inc);
gen_str:
   PUSHL %ebp
   MOVL %esp,%ebp
   MOVL   8(%ebp), %eax
   MOVL   12(%ebp), %ebx
   MOVL   16(%ebp), %ecx
   MOVL   20(%ebp), %edx
   #// Zapisujemy pierwszy argument (wskaznik) do rejestru zwracanej wartosci
   MOVL %eax, %edi
   
gen_char:
   # Zapisujemy aktualny znak do pamięci pod adres wskazywany przez rejestr rdi
   MOVL %ebx, (%edi)

   # Przesuwamy się na następną  pozycję w ciągu znaków
   INCL %edi

   # Powiększamy aktualny znak o wartość inkrementacji
   ADDL %edx, %ebx

   loop gen_char

   # Zapisujemy bajt zerowy na końcu ciągu znaków
   MOVL $0, (%edi)
   #standard ending   
   MOVL %ebp,%esp
   POPL %ebp
   ret
   