def solve():
    all=df.shape[0]#type:ignore
    houses=df[df['house_size']>2000]#type:ignore
    big=houses.shape[0]
    percentage=big/all*100
    print(round(percentage,1))