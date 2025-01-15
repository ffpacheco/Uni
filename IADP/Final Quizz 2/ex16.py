def ndias(date):
    data=pd.Timestamp('2022-6-27')#type:ignore
    return(data-date).dt.days
def solve():
    
    df.insert(10,'days', ndias(df['sold_date']))#type:ignore