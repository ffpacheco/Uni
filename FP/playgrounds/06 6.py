def min_path(path):
    minimized_path = []

    opposites = {'UP': 'DOWN', 'DOWN': 'UP', 'LEFT': 'RIGHT', 'RIGHT': 'LEFT'}

    for direction in path:
        if minimized_path and direction == opposites[minimized_path[-1]]:
        
            minimized_path.pop()
        else:
            
            minimized_path.append(direction)

    return minimized_path