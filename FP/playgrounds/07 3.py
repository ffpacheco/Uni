def most_frequent(alist):
    dic={}
    res=[]
    maxo=[]
    if len(alist)==1: return alist[0]
    for n in alist:
        if n in res:
            dic[n]+=1
        else:
            dic[n]=1
            res.append(n)

        m=max(dic.values())
    for key,value in dic.items():
        
        if value==m:
            maxo.append(key)
    if len(maxo)==1: 
        return maxo[0]
    else:
        return max(maxo)
