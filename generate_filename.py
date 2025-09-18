import random
import string

# Generate a random filename with .toml extension
filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.toml'
print(filename)