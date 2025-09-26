import random
import string

# Define the factorial function
def factorial(n):
    if n < 0:
        raise ValueError('Factorial is not defined for negative numbers.')
    if n == 0 or n == 1:
        return 1
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Generate a random filename
random_filename = 'factorial_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Write the function to the file
with open(random_filename, 'w') as f:
    f.write('# A Python function to calculate the factorial of a number\n\n')
    f.write('def factorial(n):\n')
    f.write('    if n < 0:\n')
    f.write("        raise ValueError('Factorial is not defined for negative numbers.')\n")
    f.write('    if n == 0 or n == 1:\n')
    f.write('        return 1\n')
    f.write('    result = 1\n')
    f.write('    for i in range(2, n + 1):\n')
    f.write('        result *= i\n')
    f.write('    return result\n')

print(random_filename)