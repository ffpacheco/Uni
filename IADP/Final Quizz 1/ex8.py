def solve():
    res=df['birthday'].dt.year.value_counts()#type:ignore
    print(res.tail(3))
