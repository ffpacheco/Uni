def days_until_christmas(date):
    dd,mm,yyyy=date
    daysmonth = {1: 31,2: 28,3: 31,4: 30,5: 31,6: 30,7: 31,8: 31,9: 30,10: 31,11: 30,12: 31}
    year=364
    dias=0
    if mm!=12:
        while mm!=12:
            dias+=daysmonth[mm]
            mm+=1
    if dd<=25:
        dias+=25-dd
    elif dd>25: dias=364-(dd-25)
    return dias
print(days_until_christmas((18, 12, 2022)))
