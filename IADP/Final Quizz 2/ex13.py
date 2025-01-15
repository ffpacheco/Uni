def solve():
    res=df.pivot_table(index='state', columns='status', values='price', aggfunc='mean').round(1)#type:ignore
    print(res)