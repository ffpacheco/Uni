.data
v1: .word 5, 7, 2, -10, 4

.text
	la a0, v1    # Adaptar para testar
	li a1, 5     # MEDIA e
	jal SOMA     # MAXMED
	li a7, 10
	ecall

SOMA:   # Os registos t0, t1, a0 e a1 são aqui usados! 
        # Como sub-rotina "folha" apenas deverá preservar 
        # registos 's' utilizados.
        # a0 = endereço de v e a1 = tamanho
        li   t0, 0       # Soma inicial
ciclo:  beq  a1, zero, sai     
        lw   t1, (a0)
        add  t0, t0, t1  # Atualiza soma
        addi a0, a0, 4   # Atualiza endereço
        addi a1, a1, -1  # Atualiza nº elementos não somados
        j    ciclo
sai:    mv   a0, t0
        # Outros registos aqui alterados intencionalmente:
        li   t2, -333
		li   t3, 333
		li   t4, 99
		li   t5, -1001
		li   t6, 314
	    ret

MEDIA:  # ...
	    # ...
	    ret

MAXMED: # ...
	    # ...
	    ret		