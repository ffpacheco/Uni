n =int(input())
sum=0
for i in range (1,n+1):
    num=int(input())
    sum=sum+num
mean=sum/n
print(f"Arithmetic mean = {mean:.2f}")