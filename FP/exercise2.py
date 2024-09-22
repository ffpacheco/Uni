def shopping(alist:dict,stock:dict)->tuple:
    gasto=0
    final=alist.copy()
    for item,wanted in alist.items():
        for items, (quantity,price) in stock.items():
            if item ==items:
                if quantity>=wanted:
                    final.pop(item)
                    gasto+=price*wanted
                if quantity<wanted:
                    novo=wanted-quantity
                    final[item]=novo
                    gasto+=price*quantity
    return (gasto, final)
