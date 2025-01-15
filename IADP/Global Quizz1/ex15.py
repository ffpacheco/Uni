def solve():
    low_count = 0
    fair_count = 0
    good_count = 0
    very_good_count = 0
    excellent_count = 0
    
    for total in df['Total']: #type:ignore

        if 0 <= total < 220:
            low_count += 1
        elif 220 <= total < 440:
            fair_count += 1
        elif 440 <= total < 660:
            good_count += 1
        elif 660 <= total < 880:
            very_good_count += 1
        elif 880 <= total < 1100:
            excellent_count += 1
    
    res = {
        'low': low_count,
        'fair': fair_count,
        'good': good_count,
        'very_good': very_good_count,
        'excellent': excellent_count
    }
    
    res_series = pd.Series(res, name="count")#type:ignore
    
    print(res_series)

#-------------------------------------------

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
