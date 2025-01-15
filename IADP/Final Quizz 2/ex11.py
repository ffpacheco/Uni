def solve():
    max=df['price'].idxmax()#type:ignore
    print(df.loc[max,'city'])#type:ignore