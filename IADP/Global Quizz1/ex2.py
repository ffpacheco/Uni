def solve():
    res= df.loc[[0,2] , ['Invoice ID','Total']] # type: ignore
    print(res)
