.data
	aMsg: 		.asciiz "Podaj liczb� a\n"
	bMsg: 		.asciiz "Poda liczb� b\n"
	resultMsg: 	.asciiz "Wynik: "
	
.text

	main:
	la $a0,aMsg
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t0,$v0 #$t0 przechowuje warto�c a
	
	la $a0,bMsg
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	move $t1,$v0 #$t1 przechowuje warto�� b
	
	blez $t0,add
	
	mul:
	mul $t0,$t0,$t1 #$t0 przechowuje warto�� mno�enia je�li a!=0
	j show
	
	add:
	add $t0,$t0,$t1 #$t0 przechowuje warto�� dodawania
	
	show:
	
	la $a0,resultMsg
	li $v0,4
	syscall
	
	move $a0,$t0
	li $v0,1
	syscall
	
	
	li $v0,10
	syscall
	
	