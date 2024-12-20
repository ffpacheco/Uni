n = int(input())
s = n
counter = 0
i = 0

if n == 0: 
    print("Pos number 0 = 0")

while n != 0:
    n //= 10
    counter += 1

print(f"Number of digits = {counter}")

digits = []
while s != 0:
    t = s % 10
    digits.append(t) 
    s //= 10

x=0
for r in range(counter - 1, -1, -1):
    print(f"Pos number {x} = {digits[r]}")
    x+=1
