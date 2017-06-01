	.text

getLength:
	li s0, 0 #length of the string
	la s1, stringHello #pointer to start of string
getLengthLoop:
	addi s0, s0, 1
	addi s1, s1, 1
	lbu s2, 0(s1)
	bne s2, zero, getLengthLoop
reverseString:
	la t5, stringHello
	addi s1, s1, -1
	beq s0, zero, done
	li s5, 1
	beq s0, s5, done
	srli s0, s0, 1
reverseLoop:
	lbu t2, 0(t5)
	lbu t3, 0(s1)
	sb t2, 0(s1)
	sb t3, 0(t5)
	addi t5, t5, -1
	addi s1, s1, -1
	addi s0, s0, -1
	bne s0, zero, reverseLoop
printString:
	la s3, stringHello
printStringLoop:
	lbu a0, 0(s3)
	ecall
	addi s3, s3, 1
	bne a0, zero, getLengthLoop
done:
	.long 0
.data
stringHello:
	.asciz "hello"