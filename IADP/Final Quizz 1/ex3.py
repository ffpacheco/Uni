def solve():
    global df
    print(df.shape)
    df = df[~((df['sex'] == 'Male') & (df['age'] >= 45))]
    print(df.shape)