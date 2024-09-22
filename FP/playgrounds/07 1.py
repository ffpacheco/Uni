def academy_awards(alist):
    res={}
    awards=0
    for award,movie in alist:
        if movie in res:
            res[movie]+=1
        else: res[movie]=1
        
    return res
