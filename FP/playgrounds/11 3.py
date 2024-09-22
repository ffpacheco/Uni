def solve_sudoku(board):
    for line in board:
        for i in range(len(line)):
            nu=0
            if line[i]==0:
                if 1 not in line: nu=1
                if 2 not in line: nu=2
                if 3 not in line: nu=3
                if 4 not in line: nu=4
                if 5 not in line: nu=5
                if 6 not in line: nu=6
                if 7 not in line: nu=7
                if 8 not in line: nu=8
                if 9 not in line: nu=9
            line.remove(0)
            line.insert(i,nu)
            
    return board