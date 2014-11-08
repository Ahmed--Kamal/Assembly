
.data
	string1: .asciiz "Enter the rectangle width\n"
	string2: .asciiz "Enter the rectangle length \n"
	recArea: .asciiz "Rectangle area = "
	recCircumference: .asciiz "\nRectangle circumference = "
	width: .float 2.0
	length: .float 1.0
	area: .float 2.5
	wid: .float 2.0
	len: .float 1.0

.globl	main

.text

main:
	li.s $f1, 0.0
	li.s $f2, 0.0
	li.s $f4, 0.0
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 6
	syscall
	add.s $f1, $f4, $f0			# store the width in f1
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 6
	syscall
	add.s $f2, $f4, $f0			# store the length in f2
	li.s $f3, 0.0
	mul.s $f3, $f1, $f2
	li $v0, 4
	la $a0, recArea
	syscall
	li $v0, 2
	add.s $f12, $f4, $f3
	syscall
	li $v0, 4
	la $a0, recCircumference
	syscall
	li.s $f3, 0.0
	add.s $f3, $f1, $f2
	li.s $f4, 2.0
	li $v0, 2
	mul.s $f12, $f3, $f4
	syscall
	li $v0, 10
	syscall
.end main