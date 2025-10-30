import random
import string

def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

def generate_random_filename():
    """Generate a random Python filename."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

def save_factorial_function():
    """Save the factorial function to a randomly named Python file."""
    # Generate the factorial function code as a string
    factorial_code = '''def factorial(n):
    """
    Calculate the factorial of a number.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
    """
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result'''

    # Generate a random filename
    random_filename = generate_random_filename()
    
    # Write the function to the randomly named file
    with open(random_filename, 'w') as file:
        file.write(factorial_code)
    
    print(f"Factorial function saved to {random_filename}")
    return random_filename

if __name__ == "__main__":
    save_factorial_function()