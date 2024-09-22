def summary_ranges(a_string):
    s= a_string.split(",")
    n=0
    t=1
    res=''
    while n < len(s) - 1:
            while n + t < len(s) and int(s[n]) + t == int(s[n + t]):
                res += f"{s[n]}->{s[n + t]}"
                n += 1
                t += 1

            if t == 1:
                res += f"{s[n]},"
            else:
                res += f"{s[n]}->{s[n + t - 1]},"

            t = 1
            n += t

    return res.rstrip(",")