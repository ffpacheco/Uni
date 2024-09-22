def palindrome_index(s):
    string=s[::-1]
    if string== s: return -1

    n=0
    l=len(s)-1
    while n<= l:
        string2 = s[:n] + s[n+1:]
        if string2==string2[::-1]:
            return n
        n+=1
    return -1