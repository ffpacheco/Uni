def days_until_christmas(date):
    dd, mm, yyyy = date
    daysmonth = {1: 31, 2: 28, 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31}
    dias = 0

    if mm < 12:
        while mm < 12:
            dias += daysmonth[mm]
            mm += 1

    if dd <= 25:
        dias += 25 - dd
    elif dd > 25:
        dias = dias + daysmonth[mm] - (dd - 26)

    return dias

# Example of usage:
date_example = (23, 11, 2023)
result = days_until_christmas(date_example)
print(result)
