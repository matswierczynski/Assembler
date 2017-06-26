.data
		valueMsg: 	.asciiz "Podaj liczbê do obliczenia rekurencji\n"
		resultMsg:	.asciiz "Wynik: "
.text
main:	
		li $v0,4
		la $a0,valueMsg
		syscall
	
		li $v0,5
		syscall
		add $t0,$zero,$v0
		li $s0,0
	
		jal recursion
		li $v0,4
		la $a0, resultMsg
		syscall
	
		li $v0,1
		move $a0,$s0
		syscall
	
		li $v0,10
		syscall
	
#end of main program
recursion:
	
		subu $sp,$sp,4
		sw $ra,0($sp)
	
		sub $t0,$t0,1
		bltz  $t0,recursionDone
		jal recursion
	
		mul $s0,$s0,2
		add $s0,$s0,3
	
recursionDone:
		lw $ra,0($sp)
		addu $sp,$sp,4
		jr $ra
	
	
	
	
	
	