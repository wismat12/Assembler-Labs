.data

iter:
.long	3
 
  
.text
        .type suma, @function
        .global suma

suma:
        PUSHL   %ebp
        MOVL    %esp, %ebp

        MOVL    8(%ebp), %ebx       #pobranie wsk na tablice ebx - **ptr
        MOVL    12(%ebp), %ecx       #pobranie wsk na tablice ebx - bok, iterator
        
        # index wiersza bedzie w edi
        XOR %edx, %edx
        XOR %eax, %eax
        MOVL %ecx, iter  #zmienna iter bedzie przechowywac max dlugosc boku
petla:
      MOVL (%ebx), %esi        #pobranie wskaznika na element z wiersza 
      MOVL iter, %edi
      SUBL %ecx, %edi
      
      CMP $0, %ecx #ostatnia iteracja wczytala by 5 element z wiersza ktorego nie ma dlatego przeskok
        JE wiersz  
      
       przygotowanie_wiersza:
        
       CMP $0, %edi
        JE wiersz
     
       ADDL $4, %esi
       DEC %edi
       JMP przygotowanie_wiersza
       
       wiersz:
        MOVL (%esi), %edx
        ADDL %edx, %eax

       ADDL    $4, %ebx #- przesuniecie wskaznika wiersza
       
       LOOP     petla

      
koniec:  
        MOVL    %ebp, %esp
        POPL    %ebp
        RET
        