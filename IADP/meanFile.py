filename = input("Filename:")
def fileMean (name):
    fle = open(name, "r")
    nums= [float(line.strip()) for line in fle ]

    mean=sum(nums)/len(nums)
    fle.close()
    return f"{mean:.2f}"
print(f"Mean = {fileMean(filename)}")