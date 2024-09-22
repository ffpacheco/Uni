def generate(word:str):
    res=[]

    if word[-1] == "I":
        res.append(word+"U")
    for i in range(len(word)):
        if word[i]=="M":
            res.append(word+word[i+1:])
    for k in range(len(word)):
        if word[k:k+3] == "III":
            res.append(word[:k]+"U"+word[k+3:])
    for k in range(len(word)):
        if word[k:k+2] == "UU":
            res.append(word[:k]+word[k+2:])
    return sorted(list(set(res)))