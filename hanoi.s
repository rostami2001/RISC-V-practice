.data

.text 
li a7, 5
ecall
mv t0, a0  #t0 = n

li t1,1  #t1 = A
li t2,2  #t2 = B
li t3,3  #t3 = C

li t4,1  #t4 = 1

function:
addi sp,sp,-20  # make space for 5 words on the stack
sw ra,16(sp)	#return address
sw t0,12(sp)	#n
sw t1,8(sp)
sw t3,4(sp)
sw t2,0(sp)

bgt t0,t4,recursive
mv a0,t1
li a7,1
ecall

li a0,32
li a7,11
ecall

mv a0,t3
li a7,1
ecall

li a0,32
li a7,11
ecall

addi sp,sp,20
ble ra,x0,Exit
jalr x0,0(x1)

recursive:
addi t0,t0,-1  #n = n - 1

mv t5,t3
mv t3,t2
mv t2,t5  #swap

jal ra,function

lw t2,0(sp) #restore t2
lw t3,4(sp) #restore t3
lw t1,8(sp) #restore t1

lw t0,12(sp) #restore t0
lw ra,16(sp) #restore return address

mv a0,t1
li a7,1
ecall	

li a0,32
li a7,11
ecall
        
mv a0,t3
li a7,1
ecall
        
li a0,32
li a7,11
ecall

addi t0,t0,-1  #n = n - 1
mv t5,t1
mv t1,t2
mv t2,t5  #swap

jal ra,function
        
lw t2,0(sp)
lw t3,4(sp)
lw t1,8(sp)

lw t0,12(sp)
lw ra,16(sp)

addi sp,sp,20
ble ra,x0,Exit
jalr x0,0(ra)

Exit: