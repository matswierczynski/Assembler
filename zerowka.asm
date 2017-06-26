.data
data:
 .word 5
 .word 6
 .word 4
 .word 3
.text
main:
j test
j test1
test: addi $t3, $t3, 5
add $t3, $zero, $t3
test1: addi $t3, $t3, 2
li $v0, 1
add $a0, $zero, $t3
syscall
