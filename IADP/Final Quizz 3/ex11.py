def solve():
    res=df[(df['year']==2021) & (df['position']==1)]
    print(res.loc[:,'name':'year'])