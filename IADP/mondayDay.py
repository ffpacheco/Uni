import calendar

year = int(input("Year:"))
month = int(input("Month:"))

calendarMonth = calendar.monthcalendar(year, month)

mondays = []
for week in calendarMonth:
    if week[calendar.MONDAY] != 0:
        mondays.append(week[calendar.MONDAY])

for monday in mondays:
    print(monday)
