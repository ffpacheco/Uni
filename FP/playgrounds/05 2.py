def count_until(tup) : 
    n=0
    while n<len(tuple) and type(tup[n]) != tuple:
        n += 1
    if n==len(tuple):
        n= -1
    return n 