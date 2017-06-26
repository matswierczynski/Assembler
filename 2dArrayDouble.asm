.data
	valueMsg: .asciiz "Podaj wartosc\n"
	rowMsg:		.asciiz "Wiersze:\n"
	.align 3
	array:		.space 120
	sep:	.asciiz ","
	newLine: .asciiz "\n"
	
.text
main:
	li $t0,0
	li $t1,120
	li $t2,40
	li $t3,0
	la $s0,array
	jal wczytaj
	jal wyswietl
	jal index
	j end
	
wczytaj:
	bge $t0,$t1,exit
	li $v0,4
	la $a0,valueMsg
	syscall
	li $v0,7
	syscall
	sdc1 $f0,array($t0)
	addi $t0,$t0,8
	j wczytaj
	
wyswietl:
	la $a0,rowMsg
	li $v0,4
	syscall
	li $t0,0
	
loop:
	bge $t0,$t1,exit
	li $v0,3
	ldc1 $f12,($s0)
	syscall
	li $v0,4
	la $a0,sep
	syscall
	addi $s0,$s0,8
	addi $t0,$t0,8
	addi $t3,$t3,8
	bge $t3,$t2,newRow
	j loop
	
exit:
	jr $ra
	
index:
	li $t0,40
	li $t1,16
	add $t0,$t0,$t1
	subi $s0,$s0,120
	add $s1,$s0,$t0
	ldc1 $f12,($s1)
	li $v0,3
	syscall
	
newRow:
	li $v0,4
	la $a0,newLine
	syscall
	li $t3,0
	j loop
	
end:
	li $v0,10
	syscall
	
	