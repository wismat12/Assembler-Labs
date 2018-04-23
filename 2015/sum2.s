.data
.equ a,8
.equ b,12

var:
.long 0

.text
.type sum2,@function
.global sum2

sum2:
   #standdard beginning
   PUSHL %ebp
   MOVL %esp,%ebp

   #assign variables to registers
   # %eax holds current max value
   MOVL a(%ebp),%eax
   MOVL b(%ebp),%ecx
   MOVL %eax, var
   
loop:
   INCL var
   ADDL var, %eax
   CMPL var, %ecx
   JZ end
   JMP loop
   
end:

#standard ending   
   MOVL %ebp,%esp
   POPL %ebp
#return to C program
   RET
   