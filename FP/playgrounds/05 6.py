def repeated_letter(s):
    string=''
    repeat=''
    for letters in s:
        if letters in string:
            repeat+= letters
        elif letters not in string: 
            string +=letters
    for letter in s:
        for chars in repeat:
            if letter == chars:
                return letter
    if string == s: return None