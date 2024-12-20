n=int(input())
matrix = []

for _ in range (n):
    row=[]
    for _ in range (n):
        row.append(float(input()))
    matrix.append(row)

flatList = []
for i in range (n):
    for j in range (n):
        flatList.append((matrix[i][j], i, j))

flatList.sort(reverse=True)
secondLargest = flatList[1]

print(f"2nd maximum = {secondLargest[0]:.2f}, line = {secondLargest[1]}, column = {secondLargest[2]}")