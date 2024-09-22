def rearrange(l:list):
    neg=list(filter(lambda a: a<=0,l))
    pos= list(filter(lambda b: b>0, l))
    return neg+pos
print(rearrange([12, 11, -13, -5, 6, -7, 5, -3, -6, 0]))