def solve():
    res= df.groupby(by=['city' , 'sex', 'rank']).size().reset_index(name ='num')#type:ignore
    pivoted = res.pivot_table(index=['city', 'sex'], columns='rank', values='num')
    print(pivoted)
