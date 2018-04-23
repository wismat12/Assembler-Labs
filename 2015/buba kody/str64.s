.type gen, @function
.global gen

gen:

# RDI, RSI, RDX, RCX,

#extern char* gen(char* buf, int znak, int count, int inc);
PUSH	%rdx		#zamiana miejscami rdx i rcx, bo w rcx licznik petli
MOV	%rcx, %rdx
POP	%rcx

MOV	%rdi, %rax	#adres poczatku tablicy do zwrotu

petla:
MOVB	%sil, (,%edi,1)
INC	%edi
CMP	$0,%rdx
JE skip
INC	%esi
skip:
LOOP	petla

RET
