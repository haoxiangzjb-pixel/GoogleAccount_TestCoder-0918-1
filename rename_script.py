import random
import string
import os

# Generate a random string for the filename
random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))

# Create the new filename with .r extension (lowercase as requested)
new_filename = f"{random_string}.r"

# Original filename
original_filename = "r_data_analysis.R"

# Rename the file
os.rename(original_filename, new_filename)

print(f"File renamed to: {new_filename}")