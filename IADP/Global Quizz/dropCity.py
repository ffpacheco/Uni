def solve():
    df.drop(df[df['City']=='Yangon'].index, inplace=True)