.data
.equ a,8
.equ b,12

.text
.type sum,@function
.global sum

sum:
   #standdard beginning
   PUSHL %ebp
   MOVL %esp,%ebp

   #assign variables to registers
   # %eax holds current max value
   MOVL a(%ebp),%eax
   MOVL a(%ebp),%ebx
   MOVL b(%ebp),%ecx
   
   SUBL %eax, %ecx
do_while:
   INCL %ebx
   ADDL %ebx, %eax
   LOOP do_while
   
end:

#standard ending   
   MOVL %ebp,%esp
   POPL %ebp
#return to C program
   RET
   