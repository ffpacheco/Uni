def repetiton(s:str,n:int):
    lista=[]
    contador={}
    sf=""

    for letras in s:
            lista.append(letras)
    for letra in lista[:2*n]:
            if letra in contador:
                contador[letra]+=1
            else:
                contador[letra]=1   
    for value in list(contador.values()):
            if value!=n: 
                    lista.pop(0)
                    contador.clear()
                    break
    for c in lista[:2*n]:
        sf+=c
    return sf
print(repetiton("aaabddjja",2))
        
            