.data

.text

  .type range, @function
  .globl range

range:
  # %rdi, %rsi, %rdx, %rcx, %r8 and %r9
  XOR %rax, %rax # tu bedzie zwracana wartosc
  
  CMP %rsi, %rdi
  JL end
  INC %rax
  
  CMP %rdx, %rdi
  JL end
  INC %rax
  
  CMP %rcx, %rdi
  JL end
  INC %rax
   
end: 
  ret
