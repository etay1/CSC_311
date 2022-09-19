##############################################
# Program Name: Maximum of two integers
# Programmer: (Your name)
# Date: (…)
##############################################
# Functional Description:
# A program to read 2 integer numbers and print out the larger one
##############################################
.data #Data section
Prompt1: .asciiz "To quit enter 0 \nTo calculate the surface area of a sphere enter 1\nTo calculate the surface area of a cube enter 2\nEnter your choice"
Prompt2: .asciiz "Enter x1: "
Prompt3: .asciiz "Enter x2: "
Prompt4: .asciiz "Enter y1: "
Prompt5: .asciiz "Enter y2: "


.globl main
.text #Code section
main:
#load 0-2 into temporary registers
li $t1, 0
li $t2, 1
li $t3, 2

menu:

#print the first prompt
li $v0, 4
la $a0, Prompt1
syscall



#load user choice into $t0
li $v0, 5 #system call code for Read Integer
syscall #reads the value of 1st integer into $v0
move $t0, $v0 #move the 1st integer to $t0

#LOAD EACH X & Y HERE

#Branch to label based on the first user input (type of calculation)
beq $t0, $t1, a
beq $t0, $t2, b
beq $t0, $t3, c


a: #Code to quit

b: #Calculations for sphere

c: #Calculations for cube

j menu

li $v0, 10 #terminate program run and
syscall #return control to the system