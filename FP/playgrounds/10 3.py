def prime(x):
    for i in range (2,x): 
        if x%i==0:
            return 1
def get_composites(n):
    for j in range (4,n+1):
        if prime(j)==1:
            yield j
