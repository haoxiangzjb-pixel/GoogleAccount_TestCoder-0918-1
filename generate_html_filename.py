import random
import string

# Generate a random filename with .html extension
filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.html'
print(filename)