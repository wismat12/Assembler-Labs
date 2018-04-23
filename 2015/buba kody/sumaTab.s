.type suma, @function
.global suma

suma:

	PUSH	%ebp
	MOVL	%esp, %ebp

	MOVL	12(%ebp), %edx	#bok
	MOVL	%edx, %ecx	#licznik petli=bok
	MOVL	8(%ebp), %edi	#tab
	XOR	%eax, %eax	#akumulator
	INC	%edx		#idx na przekatnej: i*bok+j,i==j => i*(bok+1)
	DEC	%ecx
	
petla:
	PUSH	%ecx
	IMUL	%edx, %ecx	#ecx = ecx*edx
	ADDL	(%edi, %ecx, 4), %eax
	POP	%ecx
	loop petla

	MOVL	%ebp, %esp
	POP	%ebp
	RET
