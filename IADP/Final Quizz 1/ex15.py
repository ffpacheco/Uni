def solve():
    group=df.pivot_table(index='status', columns='race', values='salary', aggfunc='mean').round(1)#type:ignore
    group = group[['White']] 
    print(group.loc[['Married-civ-spouse', 'Never-married']])
