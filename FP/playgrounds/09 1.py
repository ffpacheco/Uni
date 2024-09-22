def to_celsius(t:list):
    return list(map(lambda x: round((x-32)/1.8,2), t))
print (to_celsius([84.56, 79.7, 81.14, 82.4, 82.04]	))