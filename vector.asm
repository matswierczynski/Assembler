.data
	array1:   .space 20
	array2:   .space 20
	getVec1:  .asciiz "Podaj kolejny element pierwszego wektora\n"
	getVec2:  .asciiz "Podaj kolejny element drugiego wektora\n"
	retVec1:  .asciiz "\nPierwszy wektor:\n"
	retVec2:  .asciiz "\nDrugi wektor:\n"
	retIlocz: .asciiz "\nIloczyn skalarny dwóch wektorów\n"
	newLine:  .asciiz "\n"
	sep:	  .ascii ","
	
.text
main:
	addi $t0,$zero,0 #zmienna do wykonania petli 5 razy
	addi $t1,$zero,0
	jal wczytaj
	la $s0,array1
	la $s1,retVec1
	jal wyswietl
	la $s0,array2
	la $s1,retVec2
	jal wyswietl
	jal skalar
	
wczytaj:

	bgeu $t0,20,exit
	
	la $a0,getVec1  	#wiadomosc getVec1 ladujemy do $a0 do wyswietlenia
	li $v0,4		#$v0 ustawiamy do wyswietlenia lancucha znakow
	syscall 		#wykonaj
	
	li $v0,5		#wczytaj liczbe calkowita
	syscall			#wykonaj
	sw $v0,array1($t0)	#zachowaj wczytana wartosc na kolejnej pozycji tablicy1
	move $t3,$v0
	
	la $a0,getVec2  	#wiadomosc getVec2 ladujemy do $a0 do wyswietlenia
	li $v0,4		#$v0 ustawiamy do wyswietlenia lancucha znakow
	syscall 		#wykonaj
	
	li $v0,5		#wczytaj liczbe calkowita
	syscall			#wykonaj
	sw $v0,array2($t0)	#zachowaj wczytana wartosc na kolejnej pozycji tablicy2
	mul $t3,$t3,$v0
	
	addi $t0,$t0,4		#zwieksz indeks w tablicy o 4 bajty
	add $t2,$t2,$t3
	addi $t3,$zero,0
	
	j wczytaj		#powtorz petle
	
exit: 
	jr $ra
	
wyswietl:
	move $a0,$s1
	li $v0,4
	syscall
	
	addi $t0,$zero,0
petl:	bge $t0,5,exit
	lb $a0,0($s0)
	li $v0,1
	syscall
	
	la $a0,sep
	li $v0,4
	syscall
	
	addi $t0,$t0,1
	addi $s0,$s0,4
	
	j petl
	
skalar:
	la $a0,retIlocz
	li $v0,4
	syscall
	
	move $a0,$t2
	li $v0,1
	syscall
	
		
end:
	li $v0,10
	syscall
	
	