def solve():
    res=df[df['salary']>=150000] #type:ignore
    all,y = res.shape
    res2=res[(res['status'].str.startswith('Married'))]
    married=res2.shape[0]
    sol=married/all*100
    print(f"{round(sol,1)}%")
    