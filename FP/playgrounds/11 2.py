def bitonic_point(f:function):
    lista=f()
    for i in range(0,len(lista)):
        if lista[i] > lista[i+1]:
            return lista[i]