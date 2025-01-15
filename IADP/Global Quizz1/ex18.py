def solve():
    res=df.groupby(['Product line'])['City'].count() #type:ignore
    res=res.rename('count')
    res = res.sort_values(ascending=False)
    print(res)

#-------------------------------------------------------------------------

def solve():
    res=df['Product line'].value_counts() #type:ignore
    print(res)