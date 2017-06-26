.data
	valueMsg: 	.asciiz "Podaj liczbe, ktorej silnie chcesz obliczyc \n"
	resultMsg:  	.asciiz "Wynik: "
	errorMsg:	.asciiz "Podana liczba jest mniejsza od zera! \n"
	
.text
main:
	li $v0,4
	la $a0,valueMsg
	syscall
	
	li $v0,5
	syscall
	move $t2,$v0
	
	bltz $t2,error
	li $t0,1 	#wynik pocz¹tkowy w rejestrze $t0
	li $t1,0 	#rejestr pomocnuiczy s³u¿acy do mno¿enia
	
silnia:
	bge $t1,$t2, show	#warunek zakoñæzenia pêtli mmno¿enia, mno¿nik ==wprowadzonej liczbie
	addi $t1,$t1,1
	mul $t0,$t0,$t1
	b silnia
	
show:	li $v0,4
	la $a0,resultMsg
	syscall 
	
	move $a0,$t0
	li $v0,1
	syscall
	j end
	
error:
	la $a0,errorMsg
	li $v0,4
	syscall
	
end:	
	li $v0,10
	syscall