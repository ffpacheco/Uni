def last_man_standing(a_list, step):
    ind=0
    while len(a_list)>1:
        ind=ind+step-1
        if ind>len(a_list)-1:
            ind=ind%len(a_list)
        a_list.pop(ind)
    return a_list[0]