import random
import string

def factorial(n):
    """
    Calculate the factorial of a given number n.
    
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

def save_factorial_function_to_random_file():
    """
    Saves the factorial function code to a file with a random name.
    
    Returns:
        str: The name of the file where the function was saved
    """
    # Generate a random file name
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    random_filename = f"{random_name}.py"
    
    # Get the source code of the factorial function
    function_code = '''def factorial(n):
    """
    Calculate the factorial of a given number n.
    
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

    # Write the function code to the random-named file
    with open(random_filename, 'w') as file:
        file.write(function_code)
        file.write('\n\n# End of factorial function\n')
    
    return random_filename

# Example usage
if __name__ == "__main__":
    # Test the factorial function
    print(f"5! = {factorial(5)}")
    
    # Save the function to a random-named file
    saved_file = save_factorial_function_to_random_file()
    print(f"Factorial function saved to: {saved_file}")