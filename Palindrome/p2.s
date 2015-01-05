.data
	string1: .space 1000
	str1: .asciiz "Enter a string:\n"
	str2: .asciiz "is a palindrome"
	str3: .asciiz "is not a palindrome"
.text
	is_palindrome:
		addi $sp, $sp, -4
		sw $ra, 0($sp)
		li $s0, 0
		addi $s0, $a0, 0
		li $t0, -1
		li $t1, 10
		li $t2, 1
		countSize:
			lb $t2, ($s0)
			beq $t2, $t1, finish
			addi $s0, $s0, 1
			addi $t0, $t0, 1
		j countSize
		finish:
		
		li $t1, 0		#load string bytes from the begining
		li $t2, 0		#load string bytes from the end
		li $s0, 0
		li $s1, 0
		li $t3, 2
		add $s0, $s0, $a0
		add $s1, $s1, $a0
		add $s1, $s1, $t0
		addi $t0, $t0, 1
		div $t3, $t0, $t3	#now $t3 is equal to (string size)/2
		li $t4, 0
		li $v0, 1		#will have whether zeor or one
		loop:
			lb $t1, ($s0)
			lb $t2, ($s1)
			beq $t4, $t3, exit1
			bne $t1, $t2, exit
			addi $s0, 1
			addi $s1, -1
			addi $t4, 1
		j loop
		exit1:
		li $v0, 0
		exit:
		lw $ra, 0($sp)
		addi $sp, $sp, 4
		jr $ra
.globl main
main:
	li $v0, 4
	la $a0, str1
	syscall
	li $v0, 8
	la $a0, string1
	syscall
	jal is_palindrome
	beq $v0, $0, palind
	la $a0, str3
	j printMessage
	palind:
	la $a0, str2
	printMessage:
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.end main