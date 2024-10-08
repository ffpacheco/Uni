n1= int(input("value1:"))
n2= int(input("value2:"))
if n1>=n2: 
    min=n2
else:
    min=n1
gcd=1
i=1
while i <= min:
    if n2%i==0 and n1%i==0:
        gcd=i
    i+=1
print(f"the greatest common factor of {n1} and {n2} is {gcd}")