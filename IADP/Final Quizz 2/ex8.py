def solve():
    res=df.groupby('status')['status'].count()#type:ignore
    res=res.rename('count')
    res=res.sort_values(ascending=False)
    print(res)