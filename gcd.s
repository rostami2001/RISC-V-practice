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

li t4,0  #t4=0 t4 is counter

loop2:

or a1,t2,t3   #a1 is or a,b
andi a7,a1,1   # a7 = a1&1
bne a7,x0,Exitloop2
addi t4,t4,1  #t4=t4+1
srli t2,t2,1  # a>>=1
srli t3,t3,1  # b>>=1
j loop2

Exitloop2:

loop3:
andi a7,t2,1  #a7=a&1
bne a7,x0,Exitloop3
srli t2,t2,1  # a>>=1
j loop3

Exitloop3:

loop4:

loop5:
andi a7,t3,1  #a7=b&1
bne a7,x0,Exitloop5
srli t3,t3,1  # b>>=1
j loop4

Exitloop5:
ble t2,t3,noswap
mv t5,t2
mv t2,t3
mv t3,t5

noswap:
sub t3,t3,t2
beq t3,x0,Exitloop4
j loop4

Exitloop4:
sll t2,t2,t4
li a7,1
mv a0,t2
ecall

li a7,11
li a0,32
ecall	

addi t1,t1,1
beq x0,x0,loop
Exit: