#!/usr/bin/env python3
import random
import string
import os

# Generate a random filename
random_name = ''.join(random.choices(string.ascii_letters + string.digits, k=10)) + '.cr'

# Crystal program content
crystal_program = '''# Crystal program to display current time
puts Time.local
'''

# Write the Crystal program to the random file
with open(random_name, 'w') as f:
    f.write(crystal_program)

print(f"Crystal program saved to {random_name}")
print("Program content:")
print(crystal_program)