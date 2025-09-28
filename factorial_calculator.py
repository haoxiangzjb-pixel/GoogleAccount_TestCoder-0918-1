import math

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    # Using math.prod for Python 3.8+ which is efficient for calculating products
    # Fallback to a loop for older versions or for clarity using math.factorial
    return math.factorial(n)

# Example usage:
if __name__ == "__main__":
    try:
        number = 5
        result = factorial(number)
        print(f"The factorial of {number} is {result}.")
    except ValueError as e:
        print(e)
