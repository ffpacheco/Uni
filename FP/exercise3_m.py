def total_distance(dist:dict,cities):
    if len(cities)<2: return 0
    c=0
    r=0
    while c<= len(cities)-2:
        pair= (cities[c],cities[c+1]) 
        pair2= (cities[c+1], cities[c])  
        
        if pair not in dist and pair2 not in dist: 
            return -1
        if pair in dist:
            r+=(dist[pair])
        elif pair2 in dist:
            r+=(dist[pair2])
        c+=1
    return r