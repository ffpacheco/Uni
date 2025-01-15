def solve():

    low = (df['Total'] >= 0) & (df['Total'] < 220) #type:ignore
    fair = (df['Total'] >= 220) & (df['Total'] < 440) #type:ignore
    good = (df['Total'] >= 440) & (df['Total'] < 660) #type:ignore
    very_good = (df['Total'] >= 660) & (df['Total'] < 880) #type:ignore
    excellent = (df['Total'] >= 880) & (df['Total'] < 1100) #type:ignore
    
    result = pd.Series({#type:ignore
        'low': low.sum(),
        'fair': fair.sum(),
        'good': good.sum(),
        'very_good': very_good.sum(),
        'excellent': excellent.sum()
    }, name="count")
    
    print(result)
