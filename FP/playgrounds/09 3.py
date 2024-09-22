from functools import reduce
def map_filter_reduce(lst:list,f1:function,f2:function,f3:function):
    m=list(filter(f1,lst))
    m2=list(map(f2,m))
    return reduce(f3,m2)
