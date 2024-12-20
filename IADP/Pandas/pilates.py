def solve():
    pilates = df[df['class']=='pilates']    
    sorted_customers = pilates.sort_values(by='hours', ascending=False)
    res=sorted_customers.iloc[0]['name']
    print(res)
    return res
