def solve():
    global df
    df['birthday'] = pd.to_datetime(df['birthday'])#type:ignore
    df.insert(11, 'retirementdate', df['birthday']+pd.DateOffset(years=66) )#type:ignore