import numpy as np # type: ignore
rows = int(input("Number of rows ="))
columns = int (input("Number of columns ="))

a= np.zeros((rows,columns))

for i in range(rows):
    for j in range (columns):
        a[i,j]=int(input(f"a[{i},{j}]="))
        
transpost = np.transpose(a)
print("Matrix transpose:")

for line in transpost:
    print(line)
