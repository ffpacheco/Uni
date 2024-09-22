def gcd_rec(n1, n2):
    if n2== n1: return n1
    else:
        ma= max(n1, n2)
        mi= min(n1, n2)
        return gcd_rec(ma-mi, mi)
print(gcd_rec(48,18))