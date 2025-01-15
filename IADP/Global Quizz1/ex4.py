def solve():
    group= df.groupby(["City", "Product line"])["Total"].sum().round(2) #type: ignore
    maxTotal= group.max()
    maxIndex= group.idxmax()
    city, product_line = maxIndex
    print(f"{city},{product_line},{maxTotal}")