n= int(input("n:"))
minV = float('inf')
maxV = float('-inf')
sum = 0
for i in range(n):
    value = int(input(f"value({i}):")) 
    sum += value

    
    if value < minV:
        minV = value
    if value > maxV:
        maxV = value
sum-=(minV + maxV)
count = n - 2
average = sum / count
print(f"Average = {average:.2f}")