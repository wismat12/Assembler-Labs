.type range, @function
.global range

range:

PUSH	%ebp
MOVL	%esp, %ebp

MOVL	20(%ebp), %ecx	#c
MOVL	8(%ebp), %edx	#x
CMPL	%ecx, %edx
JGE	xBiggest
MOVL	16(%ebp), %ebx	#b
CMPL	%ebx, %edx
JGE	xInBC
MOVL	12(%ebp), %eax	#a
CMPL	%eax, %edx
JGE	xInAB
XOR	%eax, %eax	#xSmallest
JMP	end

xBiggest:
MOVL	$3, %eax
JMP	end

xInBC:
MOVL	$2, %eax
JMP	end

xInAB:
MOVL	$1, %eax

end:
MOVL	%ebp, %esp
POP	%ebp
RET
