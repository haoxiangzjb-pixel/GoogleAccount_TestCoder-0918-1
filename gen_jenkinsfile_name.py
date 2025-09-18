import random
import string

# Generate a random filename for Jenkinsfile
filename = 'Jenkinsfile_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8))
print(filename)