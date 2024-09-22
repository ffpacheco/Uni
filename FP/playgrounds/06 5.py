def fetch_middle(llists:list):
    res=[]
    for lists in llists:
        if len(lists)%2!=0:
           l=(len(lists)//2)
           finall=lists[l]
           res.append( finall)
        if len(lists)%2==0:
            l2=len(lists)//2
            x1=lists[l2-1]
            x2=lists[l2]
            finalmente= (x1+x2)/2
            res.append(finalmente)
    return res