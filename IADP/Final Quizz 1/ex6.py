def solve():
    res=df[df['salary']>150000] #type:ignore
    one=res.shape[0]
    res2=res[res['education']>=13]
    two=res2.shape[0]
    print(one)
    print(two)