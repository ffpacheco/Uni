def solve():
    pivot = df.pivot_table(index='class', values='age', aggfunc='mean').round(2)# type: ignore
    pivot.columns = ['avg age']
    print(pivot)
