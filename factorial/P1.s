.data
	str1: .asciiz "Enter an integer number:\n"
	str2: .asciiz "The Factorial of "
	str3: .asciiz " is:\n"
.text
	# Procedure to read an integer from user.
	readInteger:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		li $v0, 4
		la $a0, str1
		syscall
		li $v0, 5
		syscall
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra

	# Procedure to calculate the factorial for a number
	calculateFactorial:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		li $t0, 0
		addi $t0, $a0, 0	#the integer number
		li $v0, 1
		fac:
			beq $t0, $0, endFac
			mul $v0, $v0, $t0
			addi $t0, $t0, -1
		j fac
		endFac:
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
.globl main
main:
	jal readInteger
	move $a0, $v0
	li $t1, 0
	add $t1, $t1, $a0
	jal calculateFactorial
	li $s0, 0
	addi $s0, $v0, 0
	li $v0, 4
	la $a0, str2
	syscall
	li $v0, 1
	move $a0, $t1
	syscall
	li $v0, 4
	la $a0, str3
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	li $v0, 10
	syscall
.end main