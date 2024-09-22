def preorder (tree:tuple,r:list):
    for element in tree:
        if type(element)== tuple:
            return preorder(element)
        if type(element)== int:
            return 