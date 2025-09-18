#!/usr/bin/env python3
import random
import string

# Generate a random filename with .sh extension
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.sh'
print(filename)