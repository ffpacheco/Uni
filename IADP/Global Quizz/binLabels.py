def solve():
    bins = [0, 220, 440, 660, 880, 1100]
    labels = ['low', 'fair', 'good', 'very_good', 'excellent']

    df['Total'] = pd.cut(df['Total'], bins=bins, labels=labels, right=False)
    total_counts = df['Total'].value_counts()
    print(total_counts)
