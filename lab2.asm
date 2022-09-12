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
# END OF PROGRAM