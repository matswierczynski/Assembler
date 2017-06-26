.data
apostrof_z: .asciiz "'"
nl: .asciiz "\n"
kom:	.asciiz " ->jest"
ArrayOfByte: .byte

.text
main:
#wczytanie
la $a0, ArrayOfByte 
li $a1, 100000
li $v0, 8
syscall
#przygotowanie danych do sumy
# sumujemy w a0
li $a3, 0
la $a1, ArrayOfByte
# dany byte ?adujemy do a2
# petla po wszystkich bytach
loop:
lb $a2, ($a1)
jal apostrof
move $a0, $a2
li $v0, 11
syscall
jal apostrof
la $a0, nl
li $v0, 4
syscall
beq $a2, 10, end
addi $a1, $a1, 1
blt $a2, 48, loop
bgt $a2, 57, loop
add $a3, $a3, $a2
addi $a3, $a3, -48

la $a0, kom
la $v0, 4
syscall
la $a0, nl
syscall
j loop
end:
move $a0, $a3
li $v0, 1
syscall
li $v0, 10
syscall
apostrof:
la $a0, apostrof_z
la $v0, 4
syscall
jr $ra