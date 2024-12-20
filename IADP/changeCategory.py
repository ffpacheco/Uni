def solve(old_cat, new_cat):
        df['rank'] = df['rank'].astype('category')
        
        df['rank'] = df['rank'].cat.rename_categories(
            {old_cat: new_cat} if old_cat in df['rank'].cat.categories else {}
        )
