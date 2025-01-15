def solve():
    c1= (df['Customer type']=='Member') & (df['Gender']=='Male') & (df['Unit price']>99) #type:ignore
    c2= (df['Customer type']=='Normal') & (df['Gender']=='Female') & (df['Unit price']>99)#type:ignore
    res= df[c1|c2][['Customer type', 'Gender',  'Product line', 'Unit price']]#type:ignore
    print(res)
#or
def solve():
    res = df.loc[((df['Customer type'] == 'Member') & (df['Gender'] == 'Male') & (df['Unit price'] > 99)) |((df['Customer type'] == 'Normal') & (df['Gender'] == 'Female') & (df['Unit price'] > 99)), 'Customer type':'Unit price'] #type:ignore
    print (res)    