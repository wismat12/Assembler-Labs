        .data
        
        .text
        .type   usun_spacje2, @function
        .global usun_spacje2
# AL to czesc EAX, pewnie dlatego wysypywal bledy
usun_spacje2:

        PUSHL   %ebp
        MOVL    %esp, %ebp

        #pobranie adresu napisu
        MOVL    8(%ebp), %esi       #wskaznik do odczytu znakow
        MOVL    8(%ebp), %edi       #wskaznik do zapisu znakow
        PUSHL   %edi 
	#MOVL %eax, %edx z tym nie pojdzie - patrz info
        #petla usuwajaca spacje
petla:
        MOVB    (%esi), %al         #pobranie znaku
        INCL    %esi                #zwiekszenie wskaznika czytania

        #spr czy to koniec napisu
        CMPB    $0, %al
        JE      koniec_zamiany

        #spr czy to spacja
        CMPB    $(' '), %al
        JNE     przepisz_znak        #jesli nie spacja to przepisuje znak

        INCL    %ebx

        CMPL    $1, %ebx            #przepisanie pierwszej spacji
        JE      przepisz_pierwsza_spacje

        JMP     petla

przepisz_znak:
      #zamiana na duze litery
        MOVL    12(%ebp), %ecx      #wczytanie 2 arg funkcji
        
        CMPL    $0, %ecx
        JE      przepisz

        CMPB    $('a'), %al         #spr czy duza litera
        JB      przepisz

        SUBB    $('a'), %al         #zamiana litery
        ADDB    $('A'), %al
przepisz:
        XOR %ebx, %ebx	# ilosc spacji 
        MOVB %al, (%edi)
        INCL %edi
        JMP petla

przepisz_pierwsza_spacje:

        MOVB %al, (%edi)
        INCL %edi
        JMP petla
       
koniec_zamiany:
        #dodanie konczacego bajtu zerowego
        MOVB    $0, (%edi)
	POPL    %eax               #wskaznik odlozony na stosie wskazujacy na poczatek tablicy znakow
        
        MOVL    %ebp, %esp
        POPL    %ebp
        RET
        