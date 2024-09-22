def change(money):
    moedinhas={2.0:0,1.0:0, 0.5:0 , 0.2:0, 0.1:0, 0.05:0, 0.02:0, 0.01:0}
    money*=100
    for moeda,quantidade in moedinhas:
        dict[moeda]+=money//(moeda*100)
        money%=(moeda*100)
    return dict
