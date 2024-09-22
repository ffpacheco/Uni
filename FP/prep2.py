def interleave(alist1,alist2):
    if type(alist1)== int:return [alist1,alist2]
    else:
        res=[]
        for i,j in zip(alist1,alist2):
            res+=interleave(i,j)
    return res
print(interleave([1, [4,2]], [3, [7,4]]))