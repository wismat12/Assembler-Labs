.data
# definicja stałych dla przejrzystości przekazywania
# parametrów ze stosu do rejestrów e{a,b,c,d}x
.equ a,8
.equ b,12
.equ c,16
.equ d,20

.type max_diff, @function
.global max_diff

max_diff:
  PUSHL   %ebp # prolog funkcji
  MOVL   %esp,%ebp
 
  #przypisanie poszczególnych parametrów funkcji do rejestrów
  MOVL   a(%ebp), %eax
  MOVL   b(%ebp), %ebx
  MOVL   c(%ebp), %ecx
  MOVL   d(%ebp), %edx
 
  # pierwsza część programu sortuje zestaw liczb
  # tak aby każde kolejne rejestry miały wartości
  # większe lub równe niższym rejestrom
 
  # (a,b)(a,c)(a,d)(b,c)(b,d)(c,d) -> porównania par
  # rejestrów, jakie należy dokonać
 
  CMP   %eax,%ebx
  JGE   ab

  # jeżeli wartość w rejestrze ebx < eax
  # zamieniam wartości w rejestrach
  # w innym wypadku skaczę do etykiety,
  # aby pominąć zamianę

XCHG   %eax,%ebx
 
  # etykieta pozwalająca na pominięcie
  # zamiany rejestrów, jeżeli nie ma
  # takiej konieczności
ab:
 
  # analogiczny schemat działania dla
  # porównań kolejnych par rejestrów
  CMP   %eax,%ecx
  JGE   ac
 
  XCHG   %eax,%ecx
 
ac:
 
  CMP   %eax,%edx
  JGE   ad
 
  XCHG   %eax,%edx
 
ad:
 
  CMP   %ebx,%ecx
  JGE   bc

  XCHG   %ebx,%ecx
 
bc:
  CMP   %ebx,%edx
  JGE   bd
 
  XCHG   %ebx,%edx
 
bd:
 
  CMP   %ecx,%edx
  JGE   cd
 
  XCHG   %ecx,%edx
 
cd: 

  # w tym miejscu rejestry są względem siebie
  # posortowane:
  # edx >= ecx >= ebx >= eax
  # nalezy odjąć eax od edx
  # i uzyskany wynik (zapisany w rejestrze edx)
  # przenieść do rejestru eax
  # a wynik przenieść do rejestru eax, którego
  # wartość funkcja zwróci
 
  SUBL   %eax,%edx
  MOVL   %edx,%eax


end:

  # procedura końcowa powrotu do nominalnego
  # wskaźnika stosu i pozbycie się wskaźnika
  # stosu, na którym operowaliśmy w trakcie
  # działania programu
  MOVL   %ebp,%esp
  POPL   %ebp
  RET
  
  