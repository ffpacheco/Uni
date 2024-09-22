def bagdiff(xs:list,ys:list):
    for n in xs: 
        if n in ys:
            xs.remove(n)

    return xs
    