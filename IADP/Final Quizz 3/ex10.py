def solve():
    res=df[df['year']==2021]
    old=res['dob'].idxmin()
    s=res.loc[old, 'name']
    print(s)