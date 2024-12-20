import numpy as np # type: ignore
rows=int(input("Number of rows ="))
columns=int(input("Number of columns ="))

a= np.zeros((rows,columns))

for i in range(rows):
    for j in range (columns):
        a[i,j]=int(input(f"a[{i},{j}]="))

det = np.linalg.det(a)
print(f"Determinant = {det:.1f}")

print("Matrix inverse:")
inverse=np.linalg.inv(a)
for row in inverse:
    print (row)
