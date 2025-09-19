import random
import string

# Generate a random filename with .test.js extension
filename = ''.join(random.choices(string.ascii_lowercase, k=10)) + '.test.js'
print(filename)