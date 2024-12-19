def solve():
    table=pd.pivot_table(df, index='city', columns = 'class', values='name', aggfunc='count', margins=True)
    print(table)
