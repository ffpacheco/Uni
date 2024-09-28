.data
v1:	.word 1, 2, 3, -3, 23
v2:	.word 46, 1, 1, 1, 1
#v2:	.word 1, 2, 3, 4, 5

.text
	la  a0, v1
	li  a1, 5
	jal SOMA     # resultado = 26
	
	la  a0, v1
	li  a1, 5
	jal MEDIA    # resultado = 5
	
	la  a0, v1
	la  a1, v2
	li  a2, 5
	jal MAXMED   # resultado = max(5; 10) = 10 
	             # se v2 alt. resultado = max(5; 3) = 5 
	li a7, 10    # termina
	ecall

# int SOMA(int *v, int n);
SOMA:li   t0, 0
prox:lw   t1, 0(a0)
	 add  t0, t0, t1
	 addi a0, a0, 4
	 addi a1, a1, -1
	 bne  a1, zero, prox
	 mv   a0, t0
	 ret
	
# int MEDIA(int *v, int n);
MEDIA:
     addi sp, sp, -16
	 sw   ra, 0(sp)
	 sw   a1, 4(sp)
	 jal  SOMA
	 lw   a1, 4(sp)
	 div  a0, a0, a1
	 lw   ra, 0(sp)
	 addi sp, sp, 16
	 ret
	
# int MAXMED(int *v1, int *v2, int n);
MAXMED:
     addi sp, sp, -16
	 sw   ra, 0(sp)
	 sw   a1, 4(sp)
	 sw   a2, 8(sp)
	 mv   a1, a2
	 jal  MEDIA
	 sw   s0, 12(sp)
	 mv   s0, a0
	 lw   a0, 4(sp)
	 lw   a1, 8(sp)
	 jal  MEDIA
	 blt  s0, a0, L
	 mv   a0, s0
L:	 lw   s0, 12(sp)
	 lw   ra, 0(sp)
	 addi sp, sp, 16
	 ret
