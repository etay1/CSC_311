##############################################
# Program Name: Maximum of two integers
# Programmer: (Your name)
# Date: (…)
##############################################
# Functional Description:
# A program to read 2 integer numbers and print out the larger one
##############################################
.data #Data section
Prompt1: .asciiz "For addition enter 1 \nFor subtraction enter 2 \nFor multiplication enter 3 \nFor and enter 4 \nFor or enter 5"

.globl main
.text #Code section
main:

li $v0, 4
la $a0, Prompt1
syscall

li $v0, 5 #system call code for Read Integer
syscall #reads the value of 1st integer into $v0
move $t0, $v0 #move the 1st integer to $t0

li $v0, 4
la $a0, $t0
syscall



li $v0, 10 #terminate program run and
syscall #return control to the system