n=input()
words = n.split()
words.sort(key=str.lower)
sorted=' '.join(words)
print(sorted)