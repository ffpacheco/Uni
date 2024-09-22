def lost_element(s1,s2):
    for num in s1:
        if num not in s2:
            return num
    for num in s2:
        if num not in s1:
            return num