def last_man_standing(alist:list,step:int):
    if len(alist)==1: return alist[0]
    else:
        nextpop= (step-1) % len(alist)
        
        alist.pop(nextpop)
        return (last_man_standing(alist,step))
print(last_man_standing([3, 4, 1, 6, 2, 5, 7], 3))