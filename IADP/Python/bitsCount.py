bits= int(input("nbits:"))
bytes= bits//8
Mbytes= bytes//(1024*1024)
rembytes=bytes % (1024*1024)
Kbytes= rembytes // 1024
remabytes= rembytes % 1024

print(f"{Mbytes} Mbytes, {Kbytes} Kbytes, {remabytes} bytes")