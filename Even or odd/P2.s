.data
	str1: .asciiz "Enter any number to check, or zero to exit:\n"
	strOdd: .asciiz "Is Odd\n"
	strEven: .asciiz "Is Even\n"
	line: .asciiz "\n"
	strExit: .asciiz "You exited"
.text
.globl main
main:
	loopCheck:
		li $v0, 4
		la $a0, str1
		syscall
		li $v0, 5
		syscall
		beq $v0, $0, exit
		li $s0, 2
		rem $s0, $v0, $s0
		beq $s0, $0, even
		li $v0, 4
		la $a0, strOdd
		syscall
		j loopCheck
		even:
		li $v0, 4
		la $a0, strEven
		syscall
		j loopCheck
		exit:
	li $v0, 4
	la $a0, strExit
	syscall
	li $v0, 10
	syscall
.end main
