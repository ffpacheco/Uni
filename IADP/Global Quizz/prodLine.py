def solve():
    product_line_counts = df.groupby('Product line').size()
    sorted_product_line_counts = product_line_counts.sort_values(ascending=False)
    sorted_product_line_counts.name = 'count'

    print(sorted_product_line_counts)
