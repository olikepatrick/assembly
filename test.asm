Include \masm32\include\Irvine32.inc
Includelib \masm32\lib\Irvine32.lib 
includelib \masm32\lib\Kernel32.lib
includelib \masm32\lib\User32.lib


.data
msg1: .asciiz "0616202 Lab1c, Enter the number n = "
msg2: .asciiz " is a prime"
msg3: .asciiz " is not a prime, the nearest prime is "


.text
.globl main

main:
		move    $a1, $zero
		move	$a2, $zero		#a2 = flag

		li	$v0, 4
		la	$a0, msg1
		syscall

		li	$v0, 5
		syscall
		move	$a1, $v0		#a1 = n
		move	$a3, $v0		#a3 = n
		mov 
		move	$t4, $zero		#t4 = 0

p:		beq		$a3, 1, L8
		addi	$t0, $zero, 2		#t0 = i			
		mul		$t1, $t0, $t0
		slt		$t2, $a3, $t1
		bne     $t2, $zero, L2
		div     $a3, $t0
		mfhi  	$t3
		beq		$t3, $zero, L8
		addi    $t0, $t0, 1

L1:
		move	$a0, $a1
		li      $v0, 1			# call system call: print integer
		syscall
		li		$v0, 4
		la		$a0, msg3
		syscall
		move	$a0, $a3
		li		$v0, 1
		syscall
		move	$a0, $a4
		li		$v0, 1
		syscall
		jal	L4
		
L2:
		move	$a0, $a1
		li      $v0, 1			# call system call: print integer
		syscall
		li	$v0, 4
		la	$a0, msg2
		syscall	
		jal	L4



L8:		addi	$t4, $t4, 1			#t4 = i
		addi	$t5, $a3, -1
		move	$a3, $t5
		move	$a4, $a3
		beq		$a3, 1, L9
		jal	p

L9:		move	$a3, $a1
		jal L10	


L10:	addi	$t4, $t4, 1			#t4 = i
		addi	$t6, $a3, 1
		move	$a3, $t6
		move	
		beq		$a3, 1, L1
		jal	p

L4:		li      $v0, 10			# call system call: exit
  		syscall	

endp main