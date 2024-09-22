def days_until_christmas(date):
    dd,mm,yyyy =date
    daysmonth = {1: 31,2: 28,3: 31,4: 30,5: 31,6: 30,7: 31,8: 31,9: 30,10: 31,11: 30,12: 31}
    d=0
    data=0
    natal=359
    while d!=mm-1:
        d+=1
        data+=daysmonth[d]
    data+=dd 

    if natal-data>=0:
        return natal-data
    else:
        return (natal-data)+365
