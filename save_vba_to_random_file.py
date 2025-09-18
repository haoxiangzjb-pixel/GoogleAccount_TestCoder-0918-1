import random
import string
import shutil

# Generate a random filename with .vba extension
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=12)) + '.vba'
print(f"Random filename: {random_filename}")

# Copy the VBA code to the new file
source_file = '/workspace/excel_formatter.vba'
destination_file = f'/workspace/{random_filename}'

shutil.copy(source_file, destination_file)
print(f"VBA macro code copied to {destination_file}")