def solve():
    group=df.groupby(['status','race'])['age'].mean()#type:ignore
    max=group.max()
    ind=group.idxmax()
    stat, color = ind
    
    print(f"{stat}, {color}, {max:.1f}")