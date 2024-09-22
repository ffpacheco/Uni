def bubble_sort(alist:list):
    n= len(alist)
    for i in range(n - 1):
        for j in range(0, n - i - 1):
            if alist[j] > alist[j + 1]:
                alist[j], alist[j + 1] = alist[j + 1], alist[j]
    return alist