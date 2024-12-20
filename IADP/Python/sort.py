n=int(input())
lista=[]
for i in range(1,n+1):
    valor=int(input())
    lista.append(valor)
print("The sorted list is:")
lista.sort()
for value in lista:
    print(value)