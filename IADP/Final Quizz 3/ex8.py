def solve():
    res=df.groupby('name')['race'].count()
    res=res.sort_values(ascending = False)
    res=res.head(5)
    res=res.sort_index()
    res=res.rename('count')
    print(res)