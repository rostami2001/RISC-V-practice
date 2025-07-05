.data
inputnum: .space 400
n: .space 4

.text
li a7,5
ecall
mv t0,a0 # store a0 in t0

li t1,0 # t1 is i
loop:bge t1,t0,Exit
li a7,5
ecall

la t2,n
sw a0,0(t2)
li t2,0
mv t3,a0

la t4,inputnum

read:bge t2,t3,sort
li a7,5
ecall

slli t5,t2,2
add t6,t5,t4
sw a0,0(t6)

addi t2,t2,1
beq x0,x0,read

sort:
la a0,inputnum
la a1,n
lw a1,0(a1)
li a2,0

loop1:bge a2,a1,Exitloop1
addi a3,a2,-1

loop2:blt a3,x0,Exitloop2
slli t2,a3,2
add t2,a0,t2
lw t3,0(t2)
lw t4,4(t2)
bge t4,t3,Exitloop2
mv a4,a0
mv a5,a1
mv a0,a4
mv a1,a3
jal ra,swap
mv a0,a4
mv a1,a5

addi a3,a3,-1
beq x0,x0,loop2
Exitloop2:
addi a2,a2,1
beq x0,x0,loop1

Exitloop1:
la t2,inputnum
la t3,n
lw t3,0(t3)
srli t3,t3,1
slli t3,t3,2
add t2,t2,t3
lw a0,0(t2)

li a7,1
ecall

li a7,11
li a0,32
ecall

addi t1,t1,1
beq x0,x0,loop
Exit:
li a7,10
ecall

swap:
slli t3,a1,2
add t3,a0,t3

lw t2,0(t3)
lw t4,4(t3)
sw t4,0(t3)
sw t2,4(t3)
jalr zero,0(ra)