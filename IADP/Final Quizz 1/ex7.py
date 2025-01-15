def hif_und(name):
    return(name.replace('-','_'))
def solve():
    df['status']=df['status'].apply(hif_und)#type:ignore
