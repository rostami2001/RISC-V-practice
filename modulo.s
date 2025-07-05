.data 

.text 
li a7,5
ecall

mv t0,a0 # store a0 in t0
li t1,0 # t1 is i

loop:bge t1,t0,Exit
li a7,5
ecall
mv t2,a0 # t2 is A

li a7,5
ecall
mv t3,a0 # t3 is B

mv t4,t2 # t4=t2
li t5,0 # t5 is answer
loop2:blt t5,x0,Exitloop2
sub t5,t4,t3
mv t4,t5

beq x0,x0,loop2
Exitloop2:
add t5,t5,t3
mv a0,t5
li a7,1
ecall

li a7,11
li a0,32
ecall

addi t1,t1,1
beq x0,x0,loop
Exit: