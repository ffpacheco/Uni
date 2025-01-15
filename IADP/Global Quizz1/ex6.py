def solve():
    df.rename(columns={"Invoice ID":"Invoice_ID", "Customer type":"Customer_type", #type:ignore
                       "Product line":"Product_line", "Unit price": "Unit_price", "Tax 5%":"Tax_5%"}, inplace=True) 