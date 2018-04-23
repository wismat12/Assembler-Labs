.type max, @function
.global max

max:

	PUSH	%ebp
	MOVL	%esp, %ebp

	MOVL	8(%ebp), %eax	#a
	MOVL	12(%ebp), %ebx	#b
	ADDL	%ebx, %eax
	PUSH	%eax			#suma a i b

	MOVL	8(%ebp), %eax	#a -> eax
	IMUL	%ebx, %eax
	PUSH	%eax			#iloczyn

	MOVL	8(%ebp), %eax	#a -> eax
	SUBL	%ebx, %eax		#roznica -> eax = eax - ebx
	CMPL	-4(%ebp), %eax
	JL		roznicaMniejsza
#roznica wieksza
	CMPL	-8(%ebp), %eax
	JG		end				#roznicaMax
roznicaMniejsza:
	MOVL	-4(%ebp), %eax	#suma -> eax
	CMPL	%eax, -8(%ebp)
	JL		end
#iloczyn max:
	MOVL	-8(%ebp), %eax
	JMP		end
end:
	MOVL	%ebp, %esp
	POP	%ebp
	RET
