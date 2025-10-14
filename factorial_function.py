import math

def calculate_factorial(n):
    """
    Calculates the factorial of a non-negative integer n.

    Args:
        n (int): The non-negative integer for which to calculate the factorial.

    Returns:
        int: The factorial of n.

    Raises:
        ValueError: If n is negative.
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers.")
    # Using the built-in math.factorial function for efficiency and correctness
    return math.factorial(n)

# Example usage (optional, for demonstration)
if __name__ == "__main__":
    try:
        number = 5
        result = calculate_factorial(number)
        print(f"The factorial of {number} is {result}.")
    except ValueError as e:
        print(e)
