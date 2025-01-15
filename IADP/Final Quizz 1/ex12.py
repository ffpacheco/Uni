def solve():

    very_young= (df['age'] >= 0) & (df['age'] < 20) #type:ignore
    young = (df['age'] >= 20) & (df['age'] < 40) #type:ignore
    middle_age = (df['age'] >= 40) & (df['age'] < 60) #type:ignore
    old = (df['age'] >= 60) & (df['age'] < 80) #type:ignore
    very_old = (df['age'] >= 80) & (df['age'] < 100) #type:ignore
    
    result = pd.Series({#type:ignore
        'very_young': very_young.sum(),
        'young': young.sum(),
        'middle_age': middle_age.sum(),
        'old': old.sum(),
        'very_old': very_old.sum()
    }, name="count")
    print('age')
    print(result)

#------------------------------------------------
def solve():
    labels=['very_young', 'young', 'middle_age', 'old', 'very_old']
    bins=[0,20,40,60,80,100]
    res=pd.cut(df['age'], bins, right=False, labels=labels).value_counts() #type:ignore
    print(res)  