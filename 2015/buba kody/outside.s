.type outside, @function
.global outside

outside:

PUSH	%ebp
MOVL	%esp, %ebp

MOVL	16(%ebp), %ebx	#b
MOVL	12(%ebp), %eax	#a
MOVL	8(%ebp), %ecx	#x
CMPL	%eax, %ecx
JG		xBigger			#x>a -> jmp
#x<a
CMPL	%ebx, %ecx
JL		xSmallest	#x<b and x<a
#x<a and x>b
inside:
XOR		%eax, %eax
JMP		end
xBigger:				#x>a
CMPL	%ebx, %ecx
JL		inside			#x>a and x<b
xBiggest:
MOVL	$1, %eax
JMP		end
xSmallest:
MOVL	$(-1), %eax

end:
MOVL	%ebp, %esp
POP		%ebp
RET
