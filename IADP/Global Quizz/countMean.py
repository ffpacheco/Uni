def solve():
    total= df[df['Gender'] == 'Female']
    mean_total= total['Total'].mean()
    print(round(mean_total,1))
