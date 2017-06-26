.data
	fibMsg: 	.asciiz "Podaj wartoœæ ktorej wartosc Fib chcesz uzyskaæ\n"
	errorMsg: 	.asciiz "Podana liczba jest mniejsza od zera!!! \n"
	resultMsg:	.asciiz "Wynik: "
	
.text
main:	la $a0,fibMsg
	li $v0,4
	syscall
	
	li $v0,5
	syscall
	
	move $t0,$v0
	
	bltz $t0,error
	li $t1,0 #Wynik
	li $t2,1 #poprzednia liczba
	li $t3,0 #pomocniczy licznik wykonañ pêtli
	
fib:
	bge $t3,$t0,result
	move $t4,$t1 #$t4 przechowuje wartoœæ #t0 przed dodawaniem
	add $t1,$t1,$t2
	move $t2,$t4
	addi $t3,$t3,1
	b fib
	
result:
	la $a0,resultMsg
	li $v0,4
	syscall
	
	move $a0,$t1
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
	
	
	
	