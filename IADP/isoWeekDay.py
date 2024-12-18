from datetime import datetime

date_str = input("Date:")

date_obj = datetime.strptime(date_str, "%d/%m/%Y")

iso_weekday, iso_week = date_obj.isocalendar()[1], date_obj.isocalendar()[1]


print(f"weekday = {date_obj.weekday() + 1}, week = {iso_week}")
