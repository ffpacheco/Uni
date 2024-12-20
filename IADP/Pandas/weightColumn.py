def get_obs(weight):
    if weight <= 50:
        return 'underweight'
    elif weight <= 80:
        return 'normal weight'
    else:
        return 'overweight'

def solve():
    df['observation'] = df['weight'].apply(get_obs)
    
    result = df[['id', 'name', 'weight', 'observation']].head(5)
    print(result)
