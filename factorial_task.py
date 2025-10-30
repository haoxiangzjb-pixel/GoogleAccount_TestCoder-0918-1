import random
import string

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

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
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def save_factorial_to_random_file():
    """
    Save the factorial function to a randomly named Python file.
    """
    # Generate a random filename
    random_filename = 'factorial_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # The factorial function code as a string
    factorial_code = '''def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.

    Args:
        n (int): A non-negative integer.

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
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result'''

    # Write the code to the randomly named file
    with open(random_filename, 'w', encoding='utf-8') as f:
        f.write(factorial_code)
    
    print(f"Factorial function saved to: {random_filename}")
    return random_filename

# Execute the function to save to a random file
if __name__ == "__main__":
    random_file = save_factorial_to_random_file()
    print(f"Created file: {random_file}")
    # Also test the factorial function
    print(f"Test: 5! = {factorial(5)}")