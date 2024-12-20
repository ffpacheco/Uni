def solve(col_name, col_dtype):
    df[col_name] = df[col_name].astype(col_dtype)
    print(df.dtypes)
