def solve():
    res=df[(df['race']=='Black')&(df['salary']>240000)]#type:ignore
    result=res.loc[:,'race':'salary']
    print(result)