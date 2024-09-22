def add(num1, num2):
    c=0
    r=0
    num1=float(num1)
    num2=float(num2)
    if len(num1%(int(num1))
    while num1>0 and num2>0:
        a=num1//10
        num1%=10
        while num2>0:
            b=num2//10
            num2%=10
            r+=(a+b+c)%10
            c+=(a+b+c)//10
            if c>0: return str(c) + str(r) 
            elif c==0: return str(r) 
print(add('123.456','0.124'))