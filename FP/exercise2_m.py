def next_prime(number):
    def prime(numb):
        for i in range(2,numb):
            if numb%i==0: return False
        return True
    
    number += 1
    while not prime(number):
        number += 1
    return number
