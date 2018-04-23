
.text
.type sum, @function
.global sum

sum:

	PUSH	%ebp
	MOVL	%esp, %ebp

	MOVL	8(%ebp), %eax	#a
	MOVL	12(%ebp), %ebx	#b
	ADDL	%ebx, %eax

	MOVL	%ebp, %esp
	POP	%ebp

	RET
