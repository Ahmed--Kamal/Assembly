.data
	enter: .asciiz "Enter a string to be sorted\n"
	string1: .asciiz ""
.text
.globl main
main:
	li $v0, 4
	la $a0, enter
	syscall
	li $v0, 8
	la $a0, string1
	syscall

	li $s4, 1
	la $s2, string1
	li $s0, 0
	loop:
        beq $s4, $0, finish
        lb $s4, ($s2)
        addi $s0, $s0, 1
        addi $s2, $s2, 1
        j loop
	finish:

	addi $s0, -2
	li $t0, 0
	la $s2, string1
	li $s4, 0
	li $s3, 0
	loop1:
		beq $t0, $s0, exit
		li $t1, 0
		addi $t1, $t1, 1
		add $t1, $t1, $t0
		loop2:
			beq $t1 ,$s0, jump
			la $s2, string1
			add $s2, $s2,  $t0
			lb $s3, ($s2)
			la $s2, string1
			add $s2, $s2, $t1
			lb $s4, ($s2)
			bge $s4, $s3, go
			la $s2, string1
			add $s2, $s2, $t1
			sb $s3, ($s2)
			la $s2, string1
			add $s2, $s2, $t0
			sb $s4, ($s2)
			addi $t1, $t1, 1
			j loop2
			#li $v0, 1
			#move $a0, $t1
			#syscall
			go:
			addi $t1, $t1, 1
		j loop2
		jump:
		addi $t0, $t0, 1
	j loop1
	exit:
	li $v0, 4
	la $a0 , string1
	syscall
	li $v0, 10
	syscall
.end main
