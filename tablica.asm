.data
	w: .asciiz "Podaj elemnty pierwszego wektora: "
	w2: .asciiz "Podaj elemnty drugiego wektora: "
	w3: .asciiz "Wynik mnozenia wektorow: "
	spc: .asciiz ", "
	newLine: .asciiz "\n"
	tablica: .space 20
	tablica2: .space 20
.text
	jal odczyt		#procedura zczytaujaca dane do wektorow 
	la $s0, tablica		#wczytanie argumentu do procedury wysw
	jal wysw		#procedura wyswietlajaca wektor
	jal nowa		#procedura do robienia newLine
	la $s0, tablica2	#wczytanie argumentu do procedury wysw
	jal wysw		#procedura wyswietlajaca wektor
	jal nowa		#procedura do robienia newLine
	
	
	addi $t0, $zero, 6	#zmienna odpowiedzialana za ilosc "robienia sie" petli
	addi $t1, $zero, 0	#zmienna odpowiedzialna za ilosc danych w tablicy
	while2:
		beqz $t0,exit2	#warunek wyjscia
		lb $t3, tablica($t1)	#odczyta pierwszego wektora
		lb $t4, tablica2($t1)	#odczyt drugiego wektora
		add $t6, $t6, $t5	#suma iloczynu
		mul $t5, $t3, $t4	#iloczyn
		addi $t1, $t1, 1	#i++
		subi $t0, $t0, 1	#i--
		j while2
	exit2:  	
	li $v0, 4			#wyswietlenie wiadomosci
	la $a0, w3
	syscall
	li $v0, 1			#wyswietlenie wyniku
	move $a0, $t6
	syscall
	li $v0, 10			#zakonecznie programu
	syscall
	
odczyt:					#procedura odczytujaca 
	addi $t0, $zero, 5		#zmienna odpowiedzialana za ilosc "robienia sie" petli
	addi $t2, $zero, 0		#zmienna odpowiedzialna za ilosc danych w tablicy
	while:
	beqz $t0, exit			#warunek wyjscia
	
	li $v0, 4			#wyswietlenie wiadomosci
	la $a0, w
	syscall
	li $v0, 5			#odczytanie wartosci wektora od uzytkownika
	syscall
	move $t1, $v0
	sb $t1, tablica($t2)		#zapisanie wartosci w tablicy
	li $v0, 4
	la $a0, w2
	syscall
	li $v0, 5			#odczytanie wartosci wektora od uzytkownika
	syscall
	move $t1, $v0
	sb $v0, tablica2($t2)		#zapisanie wartosci w tablicy
	addi $t2, $t2, 1		#i++
	subi $t0, $t0, 1		#i--
	
	j while				#skok
	exit: 
		jr $ra
wysw:					#procedura wyswietlajaca
	addi $t0, $zero, 5		#zmienna odpowiedzialana za ilosc "robienia sie" petli
	while3:
		beqz $t0, exit3		#warunek wyjscia
		li $v0, 1		#wyswietlenie wartosci z tabeli
		lb $t2, 0($s0)	
		addi $a0, $t2, 0
		syscall
		li $v0, 4		#wyswietlenie spacji
		la $a0, spc
		syscall
		addi $s0, $s0, 1	#i++
		subi $t0, $t0, 1	#i--
		j while3
	exit3:
		jr $ra
nowa:					#procedura do wyswietlania lini
	li $v0, 4
	la $a0, newLine
	syscall
	jr $ra