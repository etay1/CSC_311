##############################################
# Program Name: Maximum of two integers
# Programmer: (Your name)
# Date: (…)
##############################################
# Functional Description:
# A program to read 2 integer numbers and print out the larger one
##############################################
.data #Data section
Prompt1: .asciiz "For addition enter 1 \nFor subtraction enter 2 \nFor multiplication enter 3 \nFor and enter 4 \nFor or enter 5\nEnter your choice: "
Prompt2: .asciiz "Enter first number: "
Prompt3: .asciiz "Enter second number: "


.globl main
.text #Code section
main:
#load 1-5 into temporary registers
li $t1, 1
li $t2, 2
li $t3, 3
li $t4, 4
li $t5, 5

#print the first prompt
li $v0, 4
la $a0, Prompt1
syscall


#load user choice into $t0
li $v0, 5 #system call code for Read Integer
syscall #reads the value of 1st integer into $v0
move $t0, $v0 #move the 1st integer to $t0

#print prompt 2
li $v0, 4
la $a0, Prompt2
syscall

li $v0, 5 #system call code for Read Integer
syscall #reads the value of 1st integer into $v0
move $t6, $v0 #move the users first number into $t6

#print prompt3
li $v0, 4
la $a0, Prompt3
syscall

li $v0, 5 #system call code for Read Integer
syscall #reads the value of 1st integer into $v0
move $t7, $v0 #move the users second number into $t7

#Branch to label based on the first user input (type of calculation)
beq $t0, $t1, a
beq $t0, $t2, b
beq $t0, $t3, c
beq $t0, $t4, d
beq $t0, $t5, e

a:
add $t8,$t6,$t7
li $v0, 1
move $a0,$t8
syscall

b:
sub $t8,$t6,$t7
li $v0, 1
move $a0,$t8
syscall

c:
mul $t8,$t6,$t7
li $v0, 1
move $a0,$t8
syscall

d:
#Here will be the code to run AND
e:
#Here will be the code to run OR

li $v0, 10 #terminate program run and
syscall #return control to the system
