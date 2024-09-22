def four_in_line(board:list):
    lin=len(board[0])
    for i, l in enumerate(board):
        for c in range(lin):
            if (l[c:c+4])==[1,1,1,1] or (l[c:c+4])==[2,2,2,2]:
                return {(i,c),(i,c+3)}
    for c in range(lin):
        temp = [0,0,0,0]
        for i,l in enumerate(board):
            temp = [temp[1], temp[2], temp[3], l[c]]
            if temp[0] == temp[1] == temp[2] == temp[3]:
                if temp[0]:
                    return {(i-3,c),(i,c)}
                
four_in_line([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 2, 0, 0], [0, 0, 2, 2, 0], [0, 1, 1, 1, 1], [0, 1, 1, 1, 2]])