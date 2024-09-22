def fib(n):
    interacoes=0
    res=[]
    if n>=1:
        res.append(0)
        interacoes+=1
    if n>=2:
        res.append(1)
        interacoes+=1
    while interacoes!=n:
        termo= res[interacoes-1]+res[interacoes-2]
        res.append(termo)
        interacoes+=1

    return res