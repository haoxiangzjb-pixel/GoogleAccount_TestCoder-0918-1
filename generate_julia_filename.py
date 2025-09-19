import random
import string

# Generate a random filename with .jl extension for Julia
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.jl'
print(f"Generated random filename: {filename}")