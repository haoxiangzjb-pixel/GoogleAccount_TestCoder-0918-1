import random
import string

# Generate a random filename with .pp extension for Puppet manifest
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.pp'
print(filename)