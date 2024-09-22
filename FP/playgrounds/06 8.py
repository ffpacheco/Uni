def is_orthogonal(mx):
    for row in mx:
        for num in row:
            if num !=0 and num !=1 and num !=(-1):
                return False
            else: return True