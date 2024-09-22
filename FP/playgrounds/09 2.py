def to_fahrenheit(t): #o mais dificil neste ex foi conseguir escrever faherienht 
    return list(map(lambda x: round(x*1.8+32,3),t))
print(to_fahrenheit([29.2, 26.5, 27.3, 28, 27.8]	))