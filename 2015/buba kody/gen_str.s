.type	gen_str, @function
.global	gen_str

gen_str:
PUSH	%ebp
MOVL	%esp, %ebp

MOVL	20(%ebp), %edx	#inc
MOVL	8(%ebp), %edi	#adres tablicy
MOVL	16(%ebp), %ecx	#licznik petli
MOVL	12(%ebp), %eax	#znak do druku
ADDB	$('0'), %al	#ascii znaku do druku

next:
	CMP	$0, %edx
	JZ	skip	#if inc==0 skip
	INC	%al
	CMP	$('9'), %eax 
	JB	cont
	MOVB	$('0'), %al
cont:
skip:	STOSB		#mem[edi++] = al
	LOOP next
MOVL	8(%ebp), %eax	#zwracana wartosc - adres stringa

MOVL	%ebp, %esp
POP	%ebp
RET
