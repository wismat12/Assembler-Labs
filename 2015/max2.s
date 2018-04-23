.data


.text
.type max2,@function
.global max2

max2:
  # %rdi - a, %rsi - b, %rdx, %rcx, %r8 and %r9
  MOVQ %rdi, %r8 #suma
  MOVQ %rdi, %r9 #iloczyn
  MOVQ %rdi, %r10 # roznica
  ADDQ %rsi, %r8
  IMULQ %rsi, %r9
  SUBQ %rsi, %r10
  
  CMP %r8, %r9
  JGE next1 
  XCHG %r8, %r9		#Zamiana wartosci miedzy rejestrami
next1:
  CMP %r8, %r10
  JGE next2 
  XCHG %r8, %r10
next2:
  CMP %r9, %r10
  JGE end 
  XCHG %r9, %r10
   
end:
  MOVQ %r8, %rax
#return to C program
   RET
   