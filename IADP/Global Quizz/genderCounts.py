def solve():
    gender_counts = df['Gender'].value_counts(normalize=True) * 100
    print(gender_counts)