.data
	valueMsg: .asciiz "Podaj wartosc x\n"
	resultMsg: .asciiz "Wynik:"
	one:		.double 1
	two:		.double 2
	three:		.double 3
	
.text
main:	
	li $v0,4
	la $a0,valueMsg
	syscall
	
	li $v0,6
	syscall
	jal power

showResult:	
	li $v0,4
	la $a0,resultMsg
	syscall
	
	li $v0,3
	mov.d $f12,$f2
	syscall
	
	li $v0,10
	syscall
	
power:
	mul.d $f2,$f0,$f0
	l.d   $f6,three
	mul.d $f2,$f2,$f6
	l.d 	$f6,two
	mul.d $f4,$f6,$f0
	l.d $f6,one
	add.d $f2,$f2,$f4
	add.d $f2,$f2,$f6
	jr $ra
	
