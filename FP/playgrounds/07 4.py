def sort_by_value(dict):
    colors=[]
    hexa=[]
    for keys, values in dict.items():
        colors.append(keys)
        hexa.append(values)
    l=list(zip(colors, hexa))
    l.sort(key=lambda x: x[1])
    return l