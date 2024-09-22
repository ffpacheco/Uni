def evaluate(a:list,x:int):
    n= enumerate(a)
    fun= sum(list(map(lambda it: it[1]*x**it[0],n)))
    return fun
print(evaluate([1, 2, 4], 5	))
