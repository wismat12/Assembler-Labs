.text

  .type combine_str, @function
  .globl combine_str

combine_str:
  # %rdi, %rsi, %rdx, %rcx, %r8 and %r9
  # Zapisujemy pierwszy argument (wskaźnik) do rejestru zwracanej wartości
 #movq %rdi, %rax  - w 64 BEZ pusha i popa działało z samym movq , 32 nie dziala wiec zeby sie nie mylilo, zmiana i tu,- stare info 
  MOVQ %rdi, %rax #tak albo przez stos przekazac wskaznik na poczatek stringa
  #PUSHQ %rdi

loop:
  #Sprawdzamy, czy nie osiągneliśmy końca ciągu znaków a lub b
  
  cmpb $0, (%rsi)
  jz aend
  cmpb $0, (%rdx)
  jz bend

  # Zapisujemy znak z ciągu a do bufora wyjściowego i przesuwamy wskaźniki
  movq (%rsi), %r8
  movq %r8, (%rdi)
  inc %rsi
  inc %rdi
  
  # Zapisujemy znak z ciągu b do bufora wyjściowego i przesuwamy wskaźniki
  movq (%rdx), %r8
  movq %r8, (%rdi)
  inc %rdx
  inc %rdi

  # Powtarzamy w pętli
  jmp loop
  
aend:
  cmpb $0, (%rdx)	#az b bedzie skonczone
  jz end
  movq (%rdx), %r8
  movq %r8, (%rdi)
  inc %rdx
  inc %rdi
  jmp aend
  
bend:
  cmpb $0, (%rsi)	#az a bedzie skonczone
  jz end
  movq (%rsi), %r8
  movq %r8, (%rdi)
  inc %rsi
  inc %rdi
  jmp bend
  
end:
  # Zapisujemy bajt zerowy na końcu bufora
  movq $0, (%rdi)
 # POPQ %rax
   
  ret
