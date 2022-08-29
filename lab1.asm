##############################################
# Program Name: Maximum of two integers
# Programmer: (Your name)
# Date: (…)
##############################################
# Functional Description:
# A program to read 2 integer numbers and print out the larger one
##############################################
.data #Data section
Prompt1: .asciiz "\nEnter the first number: "
Prompt2: .asciiz "Enter the second number: "
Result: .asciiz "The larger number is: "
.globl main
.text #Code section
main:
li $v0, 4 #system call code for Print String
la $a0, Prompt1 #load address of Prompt1 into $a0
syscall #print the Prompt1 message
li $v0, 5 #system call code for Read Integer
syscall #reads the value of 1st integer into $v0
move $t0, $v0 #move the 1st integer to $t0
li $v0, 4 #system call code for Print String
la $a0, Prompt2 #load address of Prompt2 into $a0
syscall #print the Prompt2 message
li $v0, 5 #system call code for Read Integer
syscall #reads the value of 2nd integer into $v0
move $t1, $v0 #move the 2nd integer to $t0
sgt $s0, $t0, $t1 #Check which integer is greater
bne $s0, $zero, Print_result #Branch to Print_result if $t0 is larger
move $t0, $t1 #Else: $t1 is larger
Print_result:
li $v0, 4 #System call code for Print String
la $a0, Result #load address of Result into $a0
syscall #print the string
li $v0, 1 #system call code for Print Integer
move $a0, $t0 #move value to be printed to $a0
syscall #print sum of integers
li $v0, 10 #terminate program run and
syscall #return control to the system
# END OF PROGRAM