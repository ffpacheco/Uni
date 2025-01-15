def solve():
    res=df.loc[df['house_size']>40000,'city':'house_size']#type:ignore
    print(res)