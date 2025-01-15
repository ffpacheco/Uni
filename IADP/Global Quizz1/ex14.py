def solve():
    df.loc[2,'Customer type']='Member' #type:ignore
    print(df.loc[:,'Invoice ID':'Gender'].head(3))#type:ignore
