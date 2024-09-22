def find_treasure(pos:tuple, steps:list):
    if len(steps)==0: return pos
    else:
        x,y= pos
        if steps[0] == "left": x-=1
        elif steps[0]=="right": x+=1
        elif steps[0]== "up": y+=1
        elif steps[0]== "down" : y-=1
        steps.pop(0)
        pos=(x,y)
        return find_treasure(pos,steps)