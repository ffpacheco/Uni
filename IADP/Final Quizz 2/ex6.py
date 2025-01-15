def solve():
    global df
    df=df[~(df['price']>800000)]
    