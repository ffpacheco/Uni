import time

secondSinceEpoch = float(input("Number of seconds:"))

time_tuple = time.gmtime(secondSinceEpoch)

time_string = time.strftime('%a %b %d %H:%M:%S %Y', time.gmtime(secondSinceEpoch))

print(f"{time_string}")
