def solve():
    res=df.loc[[1,4,6], 'race':'salary'] #type:ignore
    print(res)