def solve():
    data=df[df['salary']>=150000 ] #type:ignore
    min=data['age'].min()
    max=data['age'].max()
    mean=data['age'].median()
    res=pd.Series({'min':min, 'max':max, 'median':mean}, name ='age') #type:ignore
    print(res)
    