import numpy as np # type: ignore

initial = float(input("Initial value:"))
final = float(input("Final value:"))
n_values = int(input("Number of values:"))

values = np.linspace(initial, final, n_values)

squared_values = values ** 2

sum_of_squares = np.sum(squared_values)

rounded_sum = round(sum_of_squares, 2)

print(f"Sum of the array: {rounded_sum}")
