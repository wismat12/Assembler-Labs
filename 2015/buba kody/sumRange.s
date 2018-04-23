.type sumRange, @function
.global sumRange

sumRange:
PUSH	%ebp
MOVL	%esp, %ebp

MOVL	8(%ebp), %eax	#a
MOVL	12(%ebp), %ebx	#b
CMPL	%eax, %ebx
JG	ok
XCHG	%eax, %ebx		#zamiana arg miejscami, aby a<b

ok:
MOVL	%ebx, %ecx
SUBL	%eax, %ecx	#ecx = ebx-eax -> licznik petli
INC	%ecx		#+1
XOR	%edx, %edx	#wyzeruj akumulator

sumuj:
ADDL	%eax, %edx
INC	%eax
loop sumuj

MOVL	%edx, %eax
MOVL 	%ebp, %esp
POP	%ebp
RET
