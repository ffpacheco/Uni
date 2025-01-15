def solve():
    res= df.groupby(['Gender'])['City'].count()/10 #type:ignore
    res= res.rename('proportion')
    print(res)

#-------------------------------------------------------------------

def solve():
    res=df['Gender'].value_counts()/10 #type:ignore
    print(res)