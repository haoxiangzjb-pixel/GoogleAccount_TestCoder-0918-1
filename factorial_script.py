import random
import string
import os

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
    """Generate a random filename with .py extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase, k=10))
    return f"{random_name}.py"

def save_factorial_to_file():
    """Save the factorial function to a randomly named Python file."""
    filename = generate_random_filename()
    
    # Content to save
    content = '''def factorial(n):
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

# Example usage
if __name__ == "__main__":
    # Test the factorial function
    test_number = 5
    result = factorial(test_number)
    print(f"Factorial of {test_number} is {result}")
'''
    
    # Save to file
    with open(filename, 'w') as f:
        f.write(content)
    
    return filename

# Example usage
if __name__ == "__main__":
    # Save the factorial function to a random file
    filename = save_factorial_to_file()
    print(f"Factorial function saved to: {filename}")
    
    # Test the factorial function
    test_number = 5
    result = factorial(test_number)
    print(f"Factorial of {test_number} is {result}")