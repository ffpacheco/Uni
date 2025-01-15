def solve():
    c1=(df['price']>2000000 )#type:ignore
    c2=(df['house_size']<=1000)#type:ignore
    print(df.loc[c1&c2, :])#type:ignore