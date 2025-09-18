import random
import string

# Generate a random filename with .adb extension for Ada
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.adb'
print(filename)