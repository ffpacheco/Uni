def solve():
    grouped = df.pivot_table(values='Total', index='City', columns='Payment', aggfunc='sum')
    grouped = grouped.round(2)

    print(grouped)
