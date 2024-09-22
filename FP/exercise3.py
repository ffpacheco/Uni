def lfsr(n:str):
    res=""
    a=n
    falg = True
    while a!=n or falg:
        falg = False
        if a[-2]!= a[-1]: 
            a= "1"+a
        else:
            a="0"+a
        res+=str(int(a)%10)
        a=str(int(a)//10)
        while len(a)!=len(n):
            a="0"+a
    return res
