def solve():
    res= df.loc [df['Total']>1030 , 'Product line':'Total'] #type: ignore
    print(res)