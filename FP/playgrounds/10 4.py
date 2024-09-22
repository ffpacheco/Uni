def evaluate(a:list,x:int):
    return sum(tup[1]*x**tup[0] for tup in enumerate(a) )
