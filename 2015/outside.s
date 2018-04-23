.data 
.text
        .type is_outside, @function
        .global is_outside

is_outside:
        PUSHL   %ebp
        MOVL    %esp, %ebp

        MOVL    12(%ebp), %ebx       
        MOVL    16(%ebp), %ecx  
        MOVL    8(%ebp), %edx  
      
        CMPL %ebx, %ecx
        JGE dalej
        XCHG %ebx, %ecx
dalej:        
	CMPL %ecx, %edx
	JG  plus
	CMPL %ebx, %edx
	JL  minus
	JMP zero
plus:
        MOVL $1, %eax
        JMP end
minus:
        MOVL $-1, %eax
        JMP end
zero:
        MOVL $0, %eax
      
end:  
        MOVL    %ebp, %esp
        POPL    %ebp
        RET
        