import numpy as np
n=int(input())
m=int(input())

a=[]
for i in range (n):
    row=np.genfromtxt([input()], delimiter=',')
    a.append(row)

matrix1 = np.array(a)

b=[]
for i in range (n):
    row=np.genfromtxt([input()], delimiter=',')
    b.append(row)

matrix2= np.array(b)

m=matrix1 + matrix2
for row in m:
    print(row)
