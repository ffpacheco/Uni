def solve():
    df.insert(7,'QxPrice',df['Unit price']*df['Quantity'])#type:ignore
