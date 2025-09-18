import random
import string

# Generate a random filename with .yml extension
filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.yml'
print(filename)