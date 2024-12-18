n=int(input("Number of elements:"))
a=[]
b=[]

for i in range(n):
    c=int(input(f"a[{i}]:"))
    a.append(c)

for i in range(n):
    c=int(input(f"b[{i}]:"))
    b.append(c)

sum=0
for i in range(n):
    sum+= a[i]*b[i]

print(f"Scalar product = {sum:.1f}")
