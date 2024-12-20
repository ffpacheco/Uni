n = int (input ("n:"))
maior= -float('inf')
segundo= -float('inf')

for i in range (1,n+1):
    valor=int(input(f"value {i}:"))
    if valor>maior:
        segundo=maior
        maior=valor
    elif valor>segundo:
        segundo=valor
print(f"Highest value = {maior} 2nd. Highest value = {segundo}")