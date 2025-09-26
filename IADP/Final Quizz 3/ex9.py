def solve():
    lewis=df[df['name']=='Lewis Hamilton']
    mean=lewis['points'].mean().round(1)
    print(mean)
    