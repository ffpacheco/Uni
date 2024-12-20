def solve():
    grouped = df.groupby(['City', 'Product line'])['Total'].sum().reset_index()
    max_row = grouped.loc[grouped['Total'].idxmax()]
    print(f"{max_row['City']}, {max_row['Product line']}, {max_row['Total']:.2f}")
