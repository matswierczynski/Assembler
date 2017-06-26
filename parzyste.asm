.data
	getVal: .asciiz "\nPodaj liczbe\n"
	showP:  .asciiz "\nWprowadzone liczby parzyste:\n"
	showNP: .asciiz "\nWprowadzone liczby nieparzyste\n"
	newL:   .asciiz "\n"
	.align 2
	pArr:	.space 40
	.align 2
	NPArr:  .space 40
	
.text
main:
	addi $t0,$zero,0
	addi $t1,$zero,0
	addi $t3,$zero,0
	addi $t4,$zero,40
	addi $t6,$zero,2
	jal loopMain
	la $s0,pArr
	la $s1,showP
	jal wysw
	move $t0,$t1
	la $s0,NPArr
	la $s1, showNP
	jal wysw
	j end
	
	
loopMain:
	la $a0,getVal
	li $v0,4
	syscall
	bge $t3,$t4,exit
	li $v0,5
	syscall
	addi $t3,$t3,4
	div  $v0,$t6
	mfhi $t5
	beq $t5,$zero,addP
	j addNP
	
	
addP:
	sw $v0,pArr($t0)
	addi $t0,$t0,4
	j loopM
	
addNP: 
	sw $v0,NPArr($t1)
	addi $t1,$t1,4
	j loopM
	
	
wysw:
	move $a0,$s1
	li $v0,4
	syscall
	addi $t3,$zero,0
	
	
loop:	bge $t3,$t0,exit
	li $v0,1
	lw $a0,($s0)
	syscall
	li $v0,4
	la $a0,newL
	syscall
	addi $s0,$s0,4
	addi $t3,$t3,4
	j loop
	
exit:
	jr $ra

end:
	li $v0,10
	syscall
	