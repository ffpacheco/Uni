import math

def senx(x, n):

    result = 0.0 
    for k in range(n):
        term = ((-1) ** k) * (x ** (2 * k + 1)) / math.factorial(2 * k + 1)
        result += term
    return f"{result:.4f}"