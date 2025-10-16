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

def save_factorial_function():
    """
    Save the factorial function to a randomly named Python file.
    
    Returns:
        str: The name of the file where the function was saved
    """
    # Generate a random filename
    random_name = 'factorial_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'
    
    # Define the content to save
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

# Example usage:
# print(factorial(5))  # Output: 120
'''
    
    # Write the content to the randomly named file
    with open(random_name, 'w') as file:
        file.write(content)
    
    print(f"Factorial function saved to {random_name}")
    return random_name

if __name__ == "__main__":
    # Save the function to a random file
    filename = save_factorial_function()
    print(f"File created: {filename}")
    
    # Test the function to make sure it works
    print(f"Factorial of 5: {factorial(5)}")
    print(f"Factorial of 0: {factorial(0)}")
    print(f"Factorial of 10: {factorial(10)}")