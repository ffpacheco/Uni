def solve():
    all=df.shape[0]#type:ignore
    res=df.groupby('status')['status'].count()/all*100#type:ignore
    res=res.round(1)
    res=res.rename('proportion')
    res = res.sort_values(ascending=False)

    print(res)