def list_paths(dirtree:tuple):
    res=[]
    for stuff in dirtree[1]:
        if type(stuff)==str:
            res.append(dirtree[0]+"/"+stuff)
        else:
            res.extend(dirtree[0]+"/"+x for x in list_paths(stuff))

    return res
            

