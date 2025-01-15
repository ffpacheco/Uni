def solve():
    euros=df['price']*0.95#type:ignore
    df.insert(2,'price_euros',euros)#type:ignore