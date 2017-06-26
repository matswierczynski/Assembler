.data
	getVec1:  .asciiz "Podaj wartosc pierwszego wektora\n"
	getVec2:  .asciiz "Podaj wartosc drugiego wektora\n"
	newL:	  .asciiz "\n"
	showVec1: .asciiz "\nPierwszy wektor\n"
	showVec2: .asciiz "\nDrugi wektor\n" 
	showSc:	  .asciiz "\nIloczyn skalarny\n"
	sep:	  .asciiz ","
	.align 2
	vec1:	  .space 20
	.align 2
	vec2:     .space 20

.text
main:
	li $t0,0
	li $t1,20
	li $t3,0
	jal wczytaj
	la $s0,vec1
	la $s1,showVec1
	jal wyswietl
	la $s0,vec2
	la $s1,showVec2
	jal wyswietl
	
	j scalar




wczytaj:
	li $t2,0
	bge $t0,$t1,exit
	li $v0,4
	la $a0,getVec1
	syscall
	li $v0,5
	syscall
	sw $v0,vec1($t0)
	move $t2,$v0
	
	li $v0,4
	la $a0,getVec2
	syscall
	li $v0,5
	syscall
	sw $v0,vec2($t0)
	mul $t2,$t2,$v0
	add $t3,$t3,$t2
	addi $t0,$t0,4
	j wczytaj
	
wyswietl:
	move $a0,$s1
	li $v0,4
	syscall
	li $t0,0
	
loop:
	bge $t0,$t1,exit
	li $v0,1
	lw $a0,($s0)
	syscall
	
	li $v0,4
	la $a0,sep
	syscall
	addi $s0,$s0,4
	addi $t0,$t0,4
	j loop
	
exit:
	jr $ra
		
scalar:
	li $v0,4
	la $a0,showSc
	syscall
	
	li $v0,1
	move $a0,$t3
	syscall
	
end:
	li $v0,10
	syscall