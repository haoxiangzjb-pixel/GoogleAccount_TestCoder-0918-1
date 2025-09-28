import math
import os
import random
import string


def calculate_factorial(n):
    """
    Calculates the factorial of a given non-negative integer n.

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
    return math.factorial(n)


if __name__ == "__main__":
    # Generate a random filename with a .py extension
    random_filename = "factorial_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

    # Get the current working directory
    current_dir = os.getcwd()

    # Full path for the new file
    full_path = os.path.join(current_dir, random_filename)

    # Write the function definition to the new file
    with open(full_path, 'w') as f:
        f.write('''import math

def calculate_factorial(n):
    """
    Calculates the factorial of a given non-negative integer n.

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
    return math.factorial(n)
''')

    print(f"Function 'calculate_factorial' has been written to {full_path}")
