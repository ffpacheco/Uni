def maximum_depth(l):
    if len(l)==0:
        return 1
    return max(maximum_depth(x) for x in l) + 1
print(maximum_depth([[[], [], [[]]], [[]], [], [[]]]	))