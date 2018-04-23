   .data
   
   .text

   .type gen_str, @function
   .globl gen_str

#// Funkcja char* gen_str(char *buf, int start, int count, int inc);
gen_str:
   #// %rdi, %rsi, %rdx, %rcx, %r8 and %r9
   #// Zapisujemy pierwszy argument (wskaznik) do rejestru zwracanej wartosci
   movq %rdi, %rax

   # Przepisujemy argument inkrementacji do rejestru innego niż rcx, gdyż rcx będzie używany do pętli
   movq %rcx, %r8

   # Przepisujemy argument ilości znaków do rejestru pętli
   movq %rdx, %rcx
   
gen_char:
   # Zapisujemy aktualny znak do pamięci pod adres wskazywany przez rejestr rdi
   movq %rsi, (%rdi)

   # Przesuwamy się na następną  pozycję w ciągu znaków
   INC %rdi

   # Powiększamy aktualny znak o wartość inkrementacji
   addq %r8, %rsi

   loop gen_char

   # Zapisujemy bajt zerowy na końcu ciągu znaków
   movq $0, (%rdi)
   ret
   