def to_celsius(t:list):
    return [(round((x-32)/1.8,1)) for x in t ]
print (to_celsius([23.0, 28.4, 32.0, 35.6]	))