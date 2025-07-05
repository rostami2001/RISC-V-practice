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

li a7,5
ecall
mv t4,a0 # t4 is C

li t6,0
add t5,t2,t3 # t5 is A+B
bleu t5,t4,Exitloop2
add t5,t2,t4 # t5 is A+C
bleu t5,t3,Exitloop2
add t5,t3,t4 # t5 is B+C 
bleu t5,t2,Exitloop2

li t6,1
Exitloop2:
mv a0,t6
li a7,1
ecall

li a7,11
li a0,32
ecall

addi t1,t1,1
beq x0,x0,loop
Exit:
