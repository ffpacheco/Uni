import numpy as np  # type: ignore
A=[]
while True:
    row = input()
    if row.strip() == "":
        break
    A.append(list(map(float, row.split())))


B = list(map(float, input().split()))

A = np.array(A)
B = np.array(B)

solution = np.linalg.solve(A, B)

for row in A:
    print(*row)
print(*B)
print("solution:")
print(*solution)

