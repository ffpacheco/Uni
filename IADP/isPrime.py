n= int(input(n:))
isPrime = True
div=2
while div < n:
    if n % div ==0:
        isPrime == False
        break
    div +=1

if isPrime:
    print(f"{num} is prime")
else:
    print(f"{num} is not prime")