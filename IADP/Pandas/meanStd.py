def solve():
    res= df.groupby(by='rank')['age'].agg(['mean', 'std']).round(2)
    print(res)