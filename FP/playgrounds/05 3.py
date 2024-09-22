def discard_middle(s):
    if len(s) <4: return ''
    else:
        final= (s[0])+(s[1])+(s[len(s)-2])+(s[len(s)-1])
    return final