import numpy as np # type: ignore
seed = int(input("Seed:"))
rows = int(input("Rows:"))
columns = int(input("Columns:"))

np.random.seed(seed)
a = np.random.normal(0,1,(rows,columns))

mean=np.mean(a)
std=np.std(a)

print(f"Mean: {mean:.2f}, Std: {std:.2f}")
