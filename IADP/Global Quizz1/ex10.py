def solve():
    res = df.loc[df['Gender'] == 'Female', "Total"].mean().round(1) #type:ignore
    print(res)