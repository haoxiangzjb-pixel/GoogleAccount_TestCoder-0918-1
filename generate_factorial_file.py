import math
import random
import string

def calculate_factorial(n):
    """
    Calculates the factorial of a given non-negative integer.

    Args:
        n (int): The non-negative integer for which to calculate the factorial.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
        TypeError: If n is not an integer.
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer.")
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    return math.prod(range(1, n + 1))

# Generate a random filename
random_filename = f"factorial_func_{''.join(random.choices(string.ascii_lowercase + string.digits, k=8))}.py"

# Write the function definition to the randomly named file
with open(random_filename, 'w') as f:
    f.write(calculate_factorial.__doc__)
    # Get the source code of the function
    import inspect
    func_source = inspect.getsource(calculate_factorial)
    f.write(func_source)

print(f"Function 'calculate_factorial' has been written to {random_filename}")
