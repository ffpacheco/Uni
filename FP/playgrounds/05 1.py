def count_chars(a_string):
    alpha=0
    digit=0
    symb=0
    for char in a_string:
        if char.isalpha() == True:
            alpha +=1
        if char.isdigit() == True:
            digit +=1
        if char.isalpha() != True and char.isdigit() != True:
            symb +=1
    return (alpha, digit, symb)