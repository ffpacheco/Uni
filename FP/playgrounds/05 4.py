def longest(s):
    words= s.split()
    m=max(words, key=len)
    l=len(m)
    return l