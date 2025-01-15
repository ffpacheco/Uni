def solve():
    global df 
    df = df[df['City'] != 'Yangon']

#-------------------------------------------

def solve():
    df.drop(df[df['City'] == 'Yangon'].index, inplace=True)
