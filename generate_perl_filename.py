import random
import string

# Generate a random filename with .pl extension for Perl
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.pl'
print(filename)