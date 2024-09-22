from itertools import product
def bin_gen(k):
    bin= list(product(range(2),repeat=k))
    return bin
def checker(atup):   
    for i in range (len(atup)-1):
        if i==1 and i+1==1:
            return 1
        else:
            return 0

def no_consecutives(allbins, t=0):
    
    if len(allbins)==0: return t
    else:
        
        return (no_consecutives(allbins[:1],t)+checker(allbins[0]))
def no_consecutives1(k):
    return no_consecutives(bin_gen(k))

print(no_consecutives1(3))