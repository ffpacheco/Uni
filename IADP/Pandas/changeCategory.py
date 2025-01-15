def solve(old_cat, new_cat):
        df['rank'] = df['rank'].astype('category') # type: ignore
        
        df['rank'] = df['rank'].cat.rename_categories(# type: ignore
            {old_cat: new_cat} if old_cat in df['rank'].cat.categories else {}# type: ignore
        )
