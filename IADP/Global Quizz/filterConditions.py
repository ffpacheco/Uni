def solve(): 
    condition_1 = (df['Customer type'] == 'Member') & (df['Gender'] == 'Male') & (df['Unit price'] > 99)
    condition_2 = (df['Customer type'] == 'Normal') & (df['Gender'] == 'Female') & (df['Unit price'] > 99)

    filtered = df[condition_1 | condition_2][['Customer type', 'Gender',  'Product line', 'Unit price']]

    print(filtered)
