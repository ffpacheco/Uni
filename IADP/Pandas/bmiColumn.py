def solve():
    df['bmi']=df['weight']/(df['height']/100 *df['height']/100)# type: ignore
    df['bmi'] = df['bmi'].round(2)# type: ignore

    res=df[['id', 'name', 'weight' , 'height' , 'bmi']].head(3)# type: ignore
    print(res)