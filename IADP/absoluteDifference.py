n=int(input())

m=n*n
first=int(input())
dif=0
for _ in range(m - 1):
    current = int(input())
    dif = max(dif, abs(current - first))
    first = current

print(dif)
            
  

