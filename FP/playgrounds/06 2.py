def nth_lowest(lnum:list,n:int):
    interacoes = 0
    def index(list,num):
        permutacoes=0
        while list[permutacoes]!=num:
            permutacoes+=1
        return permutacoes
    while interacoes <n:
        m=min(lnum)
        ind= index(lnum,m)
        lnum=lnum[:ind]+lnum[ind+1:]
        interacoes+=1
    return lnum