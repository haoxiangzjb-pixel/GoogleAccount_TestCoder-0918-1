import random
import string

def factorial(n):
    """Calculate the factorial of a number."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Generate a random filename
random_name = 'factorial_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the function to the randomly named file
with open(random_name, 'w') as f:
    f.write('''def factorial(n):
    """Calculate the factorial of a number."""
    if n < 0:
        raise ValueError("Factorial is not defined for negative numbers")
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result''')

print(f"Factorial function saved to {random_name}")