.data
.equ a,8
.equ b,12
.equ c,16
.equ d,20


a_val:
.long 55

who_is_max:
.long 666


.text
.type max4,@function
.global max4

max4:
   #standdard beginning
   PUSHL %ebp
   MOVL %esp,%ebp

   #assign variables to registers
   # %eax holds current max value
   MOVL a(%ebp),%eax
   MOVL b(%ebp),%ebx
   MOVL c(%ebp),%ecx
   MOVL d(%ebp),%edx

   #safe copy of "a", (%eax will be used to hold current max value)
   MOVL %eax,a_val
   MOVL $1, who_is_max # set a as max

   CMP %eax,%ebx
   JG b_greater # if b > a then

   JMP compare_with_c


b_greater:
   # b is now max
   MOVL %ebx,%eax
   MOVL $2, who_is_max


compare_with_c:
   CMP %eax,%ecx
    JG c_greater # if c > max(a,b) then

   JMP compare_with_d


c_greater:
   # c is now max
   MOVL %ecx,%eax
   MOVL $3, who_is_max

compare_with_d:
   CMP %eax,%edx
    JG d_greater # if d > max(a,b,c) then

   JMP check_how_many_max

d_greater:
   # d is now max
   MOVL %edx,%eax
   MOVL $4, who_is_max



check_how_many_max:

   #%esi is counter how many times max value
   XOR %esi,%esi # zero counter

   CMP %eax,a_val
    JE inc_a

   JMP cmp_b

   inc_a:
   INCL %esi

cmp_b:
   CMP %eax,%ebx
    JE inc_b

    JMP cmp_c

   inc_b:
   INCL %esi

cmp_c:
   CMP %eax,%ecx
    JE inc_c

    JMP cmp_d

   inc_c:
   INCL %esi

cmp_d:
   CMP %eax,%edx
    JE inc_d

    JMP final

   inc_d:
   INCL %esi


final:
   #check if max was more than one time
   CMP $1, %esi
   JG max_was_many_times

   

max_was_one_time:
   # return value
   MOVL who_is_max,%eax
   JMP end

max_was_many_times:
   # return value
   MOVL $0,%eax
   JMP end


end:

#standard ending   
   MOVL %ebp,%esp
   POPL %ebp

   #return to C program
   RET
   