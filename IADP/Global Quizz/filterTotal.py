def solve():
    filtered_df = df[df['Total'] > 1030]
    result = filtered_df[['Product line', 'Unit price', 'Quantity', 'Tax 5%', 'Total']]
    print(result)
