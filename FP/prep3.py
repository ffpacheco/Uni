def four_in_line(board):
    for lines in board:
        if horizontais(lines)==True: w=1
    for line in boardvertical:
        if horizontais(line)==True: w=1
def horizontais(lista):
    sum=0
    sum2=0
    for numbers in lista[1:]: 
        sum+=numbers
    for numbs in lista[:-1]:
        sum2+=numbs
    if sum==4 or sum==8 or sum2==4 or sum2==8: return True
    else: return False
def boardvertical(board):
    colunas=[]
    for c in range (len(board[0])):
        coluna=[]
        for line in board:
            coluna.append(line[c])
        colunas.append(coluna)

            