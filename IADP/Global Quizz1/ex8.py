def solve():
    res=df.groupby(["Product line"])["Quantity"].sum() #type:ignore
    all=df['Quantity'].sum() #type:ignore
    res.loc['All']=all
    res = res.to_frame() 
    print(res)