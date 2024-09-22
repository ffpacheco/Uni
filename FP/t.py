def list_paths(dirtee):
    res=[]
    for files in dirtee[1]:
        if type(files)==str:
            res.append(dirtee[0]+"/"+files)
        else: 
            res.extend(dirtee[0]+"/"+x for x in list_paths(files))
    return res
print(list_paths(("Home", [("a", []), ("b", ["b.py", "b.c"]), ("c", []), "d.py", "e.c"])))
  