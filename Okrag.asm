.data
	podajPromien: 	.asciiz "Podaj promien okregu \n"
	podajPunktX: 	.asciiz "Podaj wspolrzedna x punktu do sprawdzenia \n"
	podajPunktY: 	.asciiz "Podaj wspolrzedna y punktu do sprawdzenia \n"
	wOkregu: 	.asciiz "Punkt jest w srodku okregu \n"
	pozaOkr:	.asciiz "Punkt jest poza okregiem \n"
	naOkr:		.asciiz "Punkt jest na okregu \n"
	czyPowt:	.asciiz "Czy chcesz powtorzyc? 0 - TAK \n"
.text

	main:
	#Zapytaj o promieñ
	la $a0,podajPromien
	li $v0,4
	syscall
	
	#Wczytaj promienñ
	li $v0,5
	syscall
	move $t0,$v0
	mul $t0,$t0,$t0 
	
	wczytP:
	#Zapytaj o wspó³rzêdn¹ X punktu
	la $a0,podajPunktX
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	
	#Zapytaj o wspó³rzêdn¹ Y punktu
	la $a0,podajPunktY
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t2,$v0
	
	#Podnieœ do kwadratu
	mul $t1,$t1,$t1
	mul $t2,$t2,$t2
	
	#Dodaj a^2 i b^2, pod $t1 suma
	add $t1,$t1,$t2
	
	#SprawdŸ punkt
	bgt $t1,$t0,pozaOkregiem
	beq $t1,$t0,naOkregu
	
	#WYpisz ¿e w okrêgu
	la $a0,wOkregu
	li $v0,4
	syscall
	j czyJeszcze
	
	pozaOkregiem:
	la $a0, pozaOkr
	li $v0,4
	syscall
	j czyJeszcze
	
	naOkregu:
	la $a0, naOkr
	li $v0,4
	syscall
	
	czyJeszcze:
	la $a0, czyPowt
	li $v0,4
	syscall
	li $v0,5
	syscall
	move $t1,$v0
	beqz $t1,wczytP
	
	
	
	
	
	