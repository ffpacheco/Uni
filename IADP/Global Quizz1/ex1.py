def solve():
    res=df.pivot_table(index='City', values='Total' ,columns='Payment', aggfunc='sum').round(2)# type: ignore
    print(res)
