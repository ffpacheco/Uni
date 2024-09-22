def budgeting(budget:int, products:dict,wishlist:dict):
    maxvalue=budget
    possibleproducts=[]
    possibleprices=[]
    buy=0
    lista={}
    
    for stuff,price in products.items():    
        while price<=maxvalue:
            possibleproducts.append(stuff)
            possibleprices.append(price)
            newproducts=dict(possibleproducts[possibleprices])
    while budget!=0:
        for waste in newproducts.keys():
            if waste in wishlist.keys:
                if waste in lista:
                    buy+=1
                else: lista[waste]=1
    return lista
        
                
