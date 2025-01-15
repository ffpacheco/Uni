def solve():
    res=df.pivot_table(index='status', columns='sex', values='age' , aggfunc='mean').round(1)#type:ignore
    print(res)