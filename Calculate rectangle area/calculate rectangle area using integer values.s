.data
	string1: .asciiz "Enter the rectangle width\n"
	string2: .asciiz "Enter the rectangle length \n"
	recArea: .asciiz "Rectangle area = "
	recCircumference: .asciiz "\nRectangle circumference = "
	x: .word 123
.text
.globl main
main:
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 5 
	syscall
	add $s0, $0, $v0 		# store the width in s0
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 5 
	syscall
	add $s1, $0, $v0 		# store the length in s1
	li $s2, 0
	mul $s2, $s1, $s0 		# Calculating the area of the rectangle
	li $v0, 4
	la $a0, recArea
	syscall
	li $v0, 1
	move $a0, $s2 			# printing the area of the rectangle after moving it to $a0
	syscall
	li $v0, 4
	la $a0, recCircumference
	syscall
	li $s3, 0
	add $s3, $s0, $s1
	li $s4, 2
	mul $s3, $s3, $s4		# Calculating the circumference of the rectangle
	li $v0, 1
	move $a0, $s3 			# printing the circumference of the rectangle after moving it to $a0
	syscall
	li $v0, 10
	syscall
.end main