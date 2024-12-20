def solve():
    grouped = df.groupby('Product line')['Quantity'].sum()
    grand_total = grouped.sum()
    result = grouped.reset_index(name='Quantity')
    result.loc[len(result)] = ['All', grand_total]
    result.set_index('Product line', inplace=True)
    print(result)