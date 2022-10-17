##############################################
# Program Name: Lab 05
# Programmer: Elijah Tay
# Date: 10/09/2022
##############################################
# Functional Description:
# A program to
##############################################
.data
Prompt1:	.asciiz "\nEnter number of terms (n): "
Prompt2:	.asciiz "Enter first term : "
Prompt3:	.asciiz "Enter nth term : "
Prompt4:	.asciiz "Common difference between terms is : "
Prompt5:	.asciiz "\nSum of first n terms is : "
Prompt6:	.asciiz "\nDo you want to calculate again? "
Prompt7:	.asciiz "\nEnter 1-Try again 0-Exit"
two:	.double  2.0

.globl main
.text #Code section
main:

	#Print "Enter number of terms (n):"
	li $v0, 4       	    
	la $a0,Prompt1    	 	  
	syscall         	 
	
	# Read number of terms to $t0	
	li $v0,5         	 # load 5 into $v0 (read integer) 
	syscall           	 # input from user
	move $t0, $v0      	 # store input into $t0
	
	#-----------------------------------------------------
	
	# Print "Enter first term:"
	li $v0, 4       	         
	la $a0, Prompt2    	 	     
	syscall
	
	#Read first term to $f4
	li $v0,7         	
	syscall           	 
	movf.d  $f4, $f0      	 
	
	#-----------------------------------------------------
	
	# Print "Enter nth term:"
	li $v0, 4       	 
	la $a0, Prompt3    	 	  
	syscall         	 
	
	# Read  nth term to $f2 -> read double
	li $v0,7         	 
	syscall           	
	movf.d  $f2, $f0      	 
	
	#COMMON DIFFERENCE --------------------------------------------
	
	# Print "Common difference between term is: "
	li $v0, 4       	     
	la $a0,Prompt4     	  
	syscall         	 
	
	sub.d $f0,$f2,$f4	 # Calculate common difference
	subi $t1,$t0,1		 # $t1 = n-1
	mtc1.d $t1,$f6		 # convert $t1 -> double -> $f6
	cvt.d.w $f6,$f6
	div.d $f12,$f0,$f6	 # common difference -> $f12
	
	li $v0,3		 #print the double value
	syscall
	
	
	#SUM OF THE FIRST N TERMS  ------------------
	
	# Print "Sum of first n term is:"
	li $v0, 4       	        
	la $a0,Prompt5     	   
	syscall         	 	
	
	add.d $f12,$f2,$f4	 # calculate sum of first n terms
	l.d $f2,two
	div.d $f12,$f12,$f2
	mtc1.d $t0,$f6		 # convert $t0 -> double -> $f6
	cvt.d.w $f6,$f6	
	mul.d $f12,$f12,$f6	 # $f12 = ((a1+an) / 2) * n
	
	li $v0,3		 # print double value
	syscall
	
	#--------------------------------------------------------
	
	# Print "Do you want to calculate again?"
	li $v0, 4       	      
	la $a0,Prompt6     	    
	syscall         	
		
loop:
	# Read number 
	li $v0,5         	 
	syscall           	
	beqz $v0,exit
	beq $v0,1,main
	
	#--------------------------------------------------------
	# Print "Do you want to calculate again?"
	li $v0, 4       	     
	la $a0,Prompt7     	 
	syscall         	 
	j loop
	
	#--------------------------------------------------------

exit:	li $v0, 10
	syscall	