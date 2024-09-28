.data
num: .word 38   # Res=3
#num: .word 32  # Res=1
#num: .word 0   # Res=0
#num: .word 1   # Res=1
#num: .word 0x80000000  # Res=1
#num: .word 0xFFFFFFFF  # Res=32

# Obs.: Para testar em FAST (ferramenta de correção automática) 
#       deve excluir as linhas anteriores e as seguintes 
#       ocupadas pelas instruções de "la" até "ecall".

.text
.global nbits1
      la   t0, num    # Para efeitos de teste, copiar 
      lw   a0, 0(t0)  # para a0 um inteiro.
      jal  ra, nbits1 # Chama a sub-rotina  
      li   a7, 10     # e
      ecall           # termina aqui.
nbits1:
      mv   t0, zero         
ciclo:beq  a0, zero, fim
      andi t1, a0, 1
      add  t0, t0, t1
      srli a0, a0, 1
      j    ciclo
fim:  mv   a0, t0
      ret
