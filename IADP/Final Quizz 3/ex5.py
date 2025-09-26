def solve():
    lewis=df[df['name']=='Lewis Hamilton']
    status=lewis[lewis['status']=='Finished']
    fin=status.shape[0]
    all=lewis.shape[0]
    print(round(fin/all*100,1))
    