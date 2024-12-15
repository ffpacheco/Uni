filename=input("Filename:")
id=input("Name id:")

file=open(filename,"r")
for line in file:
    fields= line.strip().split(';')

    if fields[0] == id:
         print(';'.join(fields)) 
