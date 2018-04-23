.type greatest, @function
.global	greatest

greatest:

PUSH	%ebp
MOVL	%esp, %ebp

MOVL	8(%ebp),%eax	#a
MOVL	12(%ebp),%ebx	#b
MOVL	16(%ebp),%ecx	#c
CMPL	%eax, %ebx
JL	aBigger		#a>b

#bBigger:
CMPL	%ebx, %ecx
JG	bBiggest	#b>c
MOVL	%ecx, %eax	#c>b
JMP end

aBigger:
CMPL	%eax, %ecx
JA	cBiggest
JMP 	end		#aBiggest

bBiggest:
MOVL	%ebx, %eax	#b>c
JMP end

cBiggest:
MOVL	%ecx, %eax

end:
MOVL	%ebp, %esp
POP	%ebp
RET

