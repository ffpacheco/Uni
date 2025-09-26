def solve():
    max=df['fastest_lap_speed'].idxmax()
    res = df.loc[[max], ['name', 'race', 'fastest_lap_speed']]
    print(res)