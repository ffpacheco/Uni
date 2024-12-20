def solve():
    
    df['bmi']=df['weight']/(df['height']/100 *df['height']/100)
    df['bmi'] = df['bmi'].round(2)

    res=df[['id', 'name', 'weight' , 'height' , 'bmi']].head(3)
    print(res)