def solve():
    res=df.pivot_table(index="City", columns="Customer type", values="Invoice ID", aggfunc="count", margins=True)#type:ignore
    print(res)