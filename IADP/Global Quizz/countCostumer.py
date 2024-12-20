def solve():
     pivot_table = pd.pivot_table(df, values='Invoice ID', index='City', columns='Customer type', aggfunc='count', margins=True)
     print(pivot_table)
