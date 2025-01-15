def solve():
    singleMen=df[(df['sex']=='M') & (df['status']=='single')]#type:ignore
    res=singleMen.shape[0]
    print(res)
    return res
