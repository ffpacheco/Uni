def solve():
    bins=[0,1000,2000,3000,5000,10000]
    labels=['very_small', 'small', 'medium', 'large', 'very_large']
    res=pd.cut(df['house_size'],bins, right=False,labels=labels).value_counts()#type:ignore
    print(res)