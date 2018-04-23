.data
.equ a,8
.equ b,12
.equ c,16
.equ d,20

.text
.type max44,@function
.global max44

max44:
   #standdard beginning
   PUSHL %ebp
   MOVL %esp,%ebp

   #assign variables to registers
  #edi index liczby maksymalnej
   MOVL a(%ebp),%eax
   MOVL b(%ebp),%ebx
   MOVL c(%ebp),%ecx
   MOVL d(%ebp),%edx
 
   MOVL $1, %edi 
   
   CMP %eax,%ebx
   JL c_vs_maxab
   
   MOVL $2, %edi 
   XCHG %eax,%ebx

c_vs_maxab:
   CMP %eax,%ecx
   JL d_vs_maxabc
   
   MOVL $3, %edi 
   XCHG %eax,%ecx

d_vs_maxabc:
   CMP %eax,%edx
   JL amount

   MOVL $4, %edi
   XCHG %eax,%edx

amount:
  CMP %eax,%ebx
  JNE next
  INC %esi
next:
  CMP %eax,%ecx
  JNE next2
  INC %esi
next2:
  CMP %eax,%edx
  JNE final
  INC %esi

final:
   #check if max was more than one time
   CMP $1, %esi
   JG max_was_many_times

max_was_one_time:
   # return value
   MOVL %edi,%eax
   JMP end

max_was_many_times:
   # return value
   MOVL $0,%eax

end:

#standard ending   
   MOVL %ebp,%esp
   POPL %ebp

   #return to C program
   RET
   