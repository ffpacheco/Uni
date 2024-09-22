def map(pos, steps):
    x,y = pos
    steps = steps.split("-")
    for direçao in steps:
        if direçao== "up": y +=1
        if direçao== "down": y -=1
        if direçao== "right": x +=1
        if direçao== "left" : x -=1
    return (x,y) 