def fib(start:int,end:int):
    p=1
    s=1
    p,s=1,1
    for _ in range(2,end):
        valor=p+s
        yield(valor)
        p,s=s,valor
print(fib(1,7))
