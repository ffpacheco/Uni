def solve():
    df.insert(2,'surname',df['name'].str.split(' ').str[-1])