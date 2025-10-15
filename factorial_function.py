import random
import string

def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result

# Generate a random filename
def generate_random_filename():
    """Generate a random filename with .py extension"""
    letters = string.ascii_lowercase + string.digits
    random_name = ''.join(random.choice(letters) for i in range(10))
    return f"{random_name}.py"

# Save the factorial function to a randomly named file
def save_factorial_function_to_random_file():
    """Save the factorial function to a randomly named file"""
    random_filename = generate_random_filename()
    
    # The content to be saved in the file
    content = '''def factorial(n):
    """
    Calculate the factorial of a non-negative integer n.
    
    Args:
        n (int): A non-negative integer
    
    Returns:
        int: The factorial of n
    
    Raises:
        ValueError: If n is negative
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("Input must be an integer")
    
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    
    return result'''

    with open(random_filename, 'w') as file:
        file.write(content)
    
    print(f"Factorial function saved to {random_filename}")
    return random_filename

# Example usage
if __name__ == "__main__":
    # Test the factorial function
    print("Testing factorial function:")
    print(f"5! = {factorial(5)}")
    print(f"0! = {factorial(0)}")
    print(f"1! = {factorial(1)}")
    
    # Save the function to a random file
    random_file = save_factorial_function_to_random_file()