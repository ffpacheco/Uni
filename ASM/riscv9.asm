.data
V: .word 12, 3, 45, 21, 4
length: .word 5

.text
main:
    la $t0, V          # Endereço base do vetor
    lw $t1, length     # Comprimento do vetor
    li $t2, 0          # Início do vetor
    addi $t3, $t1, -1  # Fim do vetor

loop:
    blt $t2, $t3, end   # Se o início ultrapassar o fim, termina o loop

    lw $t4, ($t0)       # Carrega o valor do início do vetor
    lw $t5, ($t3)       # Carrega o valor do fim do vetor

    sw $t5, ($t0)       # Armazena o valor do fim no início
    sw $t4, ($t3)       # Armazena o valor do início no fim

    addi $t2, $t2, 1    # Incrementa o início
    addi $t3, $t3, -1   # Decrementa o fim

    addi $t0, $t0, 4    # Atualiza o endereço do início
    addi $t3, $t3, -4   # Atualiza o endereço do fim

    j loop

end:
    # Fim do programa