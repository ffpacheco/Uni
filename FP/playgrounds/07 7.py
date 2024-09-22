def treasure(clues:dict):
    inicial=(0,0)
    while inicial in clues:
        nexpos= clues[inicial] 
        clues.pop(inicial)
        inicial=nexpos
    return nexpos
print(treasure({(0, 0): (1, 0), (1, 0): (2, 0), (2, 0): (3, 0)}))
