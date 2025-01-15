def solve():
    c1=(df['education']>15)&(df['salary']<35000)#type:ignore
    c2=(df['education']<5)&(df['salary']>100000)#type:ignore
    res=df[c1|c2][['education', 'status', 'occupation', 'relationship', 'race', 'sex', 'weekhours', 'country', 'salary']]#type:ignore
    print(res)