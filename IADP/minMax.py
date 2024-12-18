
import numpy as np # type: ignore
name=input("Filename:")
a= np.genfromtxt(name,delimiter =';')
rows, cols = a.shape

max=np.max(a)
maxpos=np.argmax(a)
max_row = maxpos // cols
max_col = maxpos % cols   
min=np.min(a)
minpos=(np.argmin(a))

min_row = minpos // cols
min_col = minpos % cols 
print(f"Max: {max}, ({max_row},{max_col})")

print(f"Min: {min}, ({min_row},{min_col})")
