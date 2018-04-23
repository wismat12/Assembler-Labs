.type spaces, @function
.global spaces

spaces:
	PUSH	%ebp
	MOVL	%esp, %ebp

	XOR	%dl, %dl	#flaga reprez. spacje na poprzedniej pozycji(wtedy==1)
	XOR	%eax, %eax
	MOVL	8(%ebp), %esi	#wskaznik tekstu
	MOVL	%esi, %edi
	MOVL	$100, %ecx

usuwaj:
	LODSB			#pobierz znak do al	z %esi	#esi+1
	CMPB	$('\0'), %al	#zakoncz, jesli koniec stringa
	JZ	end

	CMPB	$(' '), %al
	JNE	innyZnak	#jesli nie spacja
#spacja:
	CMPB	$0, %dl		#czy byla spacja wczesniej
	JE	pierwsza	#1. spacja -> przejdz do nastepnego znaku
#kolejna spacja
	INC	%dl
	JMP	skip

innyZnak:
	STOSB
	XOR	%dl, %dl	#zeruj flage
	JMP	skip
pierwsza:
	STOSB
	INC	%dl
skip:
	loop usuwaj

end:
	MOVL	8(%ebp), %eax	#wskaznik tekstu do zwrotu
	MOVL	%ebp, %esp
	POP	%ebp
	RET

