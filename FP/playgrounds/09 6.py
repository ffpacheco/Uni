def generator(intlist: list):
    return(x for tup in intlist for x in range(tup[0],tup[1]))