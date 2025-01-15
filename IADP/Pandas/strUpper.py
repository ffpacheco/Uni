def solve():    
    df['city'] = df['city'].str.upper()# type: ignore
    print(df.head(3))# type: ignore
