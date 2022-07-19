
.data
prompt: .ascii "\nNth Fibonacci Number\n\n"
.asciiz "Enter N value: "
results: .asciiz "\nFibonacci of N = "


.text
.globl main 
main:

li $v0, 4 # print prompt string
la $a0, prompt
syscall
li $v0, 5 # read N (as integer)
syscall

add $a0, $v0, $zero
jal fib

li $v0, 4 # print prompt string
la $a0, results
syscall
li $v0, 1 # print integer
lw $a0, $zero
syscall

li $v0, 10 # terminate
syscall # system call


fib:
sub $sp, $sp, 8
sw $ra, ($sp)
sw $s0, 4($sp)
add $v0, $a0, $zero

ble $a0, 1, fibDone
add $s0, $a0, $zero
sub $a0, $a0, 1
jal fib
add $a0, $s0, $zero
sub $a0, $a0, 2 # set n-2
add $s0, $v0, $zero
# save fib(n-1)
jal fib # get fib(n-2)
add $v0, $s0, $v0 # fib(n-1)+fib(n-2)


fibDone:
lw $ra, ($sp)
lw $s0, 4($sp)
add $sp, $sp, 8
jr $ra

