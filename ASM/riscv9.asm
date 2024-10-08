.data
V: .word 12, 3, 45, 21, 4
length: .word 5

.text
main:
    la $t0, V          # Endere�o base do vetor
    lw $t1, length     # Comprimento do vetor
    li $t2, 0          # In�cio do vetor
    addi $t3, $t1, -1  # Fim do vetor

loop:
    blt $t2, $t3, end   # Se o in�cio ultrapassar o fim, termina o loop

    lw $t4, ($t0)       # Carrega o valor do in�cio do vetor
    lw $t5, ($t3)       # Carrega o valor do fim do vetor

    sw $t5, ($t0)       # Armazena o valor do fim no in�cio
    sw $t4, ($t3)       # Armazena o valor do in�cio no fim

    addi $t2, $t2, 1    # Incrementa o in�cio
    addi $t3, $t3, -1   # Decrementa o fim

    addi $t0, $t0, 4    # Atualiza o endere�o do in�cio
    addi $t3, $t3, -4   # Atualiza o endere�o do fim

    j loop

end:
    # Fim do programa