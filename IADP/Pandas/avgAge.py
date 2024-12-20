def solve():
    pivot = df.pivot_table(index='class', values='age', aggfunc='mean').round(2)
    pivot.columns = ['avg age']
    print(pivot)
