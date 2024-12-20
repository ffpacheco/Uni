def solve():
    reference_date = pd.Timestamp('2022-01-01')
    df['years'] = (( reference_date -df['date'] ).dt.days / 365).astype(int)
