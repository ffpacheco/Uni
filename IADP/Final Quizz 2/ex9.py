def solve():
    res=df.sort_values(by='price', ascending=False)#type:ignore
    print(res.head(3))