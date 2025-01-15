def solve():
    table=pd.pivot_table(df, index='city', columns = 'class', values='name', aggfunc='count', margins=True)#type:ignore
    print(table)
