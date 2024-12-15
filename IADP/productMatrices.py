n = int(input())
m = int(input())
p = int(input())

matrixA=[]
matrixB=[]
for _ in range (n):
    row=[]
    for _ in range (m):
        a = int(input())
        row.append(a)
    matrixA.append(row)

for _ in range (m):
    row=[]
    for _ in range (p):
        a = int(input())
        row.append(a)
    matrixB.append(row)

res=[]
for _ in range (n):
    row=[]
    for _ in range (p):
        row.append(0)
    res.append(row)

for i in range(n):
    for j in range(p):
        for k in range(m):
            res[i][j] += matrixA[i][k] * matrixB[k][j]


for row in res:
    print([float(x) for x in row])
