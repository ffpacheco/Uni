def solve():
    res=df['age'].min()#type:ignore
    data=df[df['age']==res]#type:ignore
    print(f"Minimum age: {res}")
    print(f"Average salary for people with that age: {data['salary'].mean().round(1)}")
    