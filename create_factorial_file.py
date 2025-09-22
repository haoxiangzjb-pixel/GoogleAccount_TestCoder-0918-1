import random
import string

def generate_random_filename():
    """Generate a random filename with .py extension"""
    filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.py'
    return filename

def factorial(n):
    """
    Calculate the factorial of a number
    
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

# Generate random filename
filename = generate_random_filename()
print(f"Saving to file: {filename}")

# Save the function to the random file
with open(filename, 'w') as f:
    f.write("def factorial(n):\n")
    f.write('    """\n')
    f.write("    Calculate the factorial of a number\n\n")
    f.write("    Args:\n")
    f.write("        n (int): A non-negative integer\n\n")
    f.write("    Returns:\n")
    f.write("        int: The factorial of n\n\n")
    f.write("    Raises:\n")
    f.write("        ValueError: If n is negative\n")
    f.write("        TypeError: If n is not an integer\n")
    f.write('    """\n')
    f.write("    if not isinstance(n, int):\n")
    f.write("        raise TypeError('Input must be an integer')\n")
    f.write("    if n < 0:\n")
    f.write("        raise ValueError('Factorial is not defined for negative numbers')\n")
    f.write("    if n == 0 or n == 1:\n")
    f.write("        return 1\n")
    f.write("    result = 1\n")
    f.write("    for i in range(2, n + 1):\n")
    f.write("        result *= i\n")
    f.write("    return result\n\n")
    f.write("# Example usage:\n")
    f.write("# print(factorial(5))  # Should output 120\n")

print("File saved successfully!")