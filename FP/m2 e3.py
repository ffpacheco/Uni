def exacly(s):
    for i in range (0,len(s)-1):
        for j in range (0,len(s)-1):
            if s[i].isdigit and s[j].isdigit and int(s[j])+int(s[i])==10:
                meio=s[:i]+s[int(j)+1:]
                if len(meio)==3:
                    for m in meio:
                        if meio[m].ispontuation:
                            return f"The sequence {s} is OK with the pairs: ('{i}{j}'"
        return f"The sequence {s} is NOT OK with the violation with pair: ('{i}{j}'"
print(exacly("acc?7??sss?3rr1??????5???5"))