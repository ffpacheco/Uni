def recursive_dot(l1,l2):
    if type(l1)==int and type(l2)==int:return l1*l2
    elif len(l1)==0: return 0
    else:
        return recursive_dot(l1[0], l2[0])+ recursive_dot(l1[1:],l2[1:])
print(recursive_dot([1, [2, 3]], [4, [5, 6]]))

        #OUUU

def recur(l1,l2):
    if type(l1)==int: return l1*l2
    sum=0
    for i, j in zip(l1,l2):
        sum+=recursive_dot(i,j)
    return sum
print(recur([1, [2, 3]], [4, [5, 6]]))