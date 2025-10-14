import pandas as pd
import random
import string
import os

def generate_random_filename(ext=".py"):
    """Generates a random filename with the given extension."""
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}{ext}"

# 1. Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# 2. Filter the DataFrame based on a condition (e.g., Age > 27)
filtered_df = df[df['Age'] > 27]

# 3. Generate the content for the new Python script
script_content = f'''import pandas as pd

# This script was generated automatically.
# Filtered DataFrame saved to 'filtered_data.csv'.

data = {filtered_df.to_dict('records')}
df = pd.DataFrame(data)
print("Filtered DataFrame:")
print(df)
df.to_csv('filtered_data.csv', index=False)
'''

# 4. Generate a random filename for the new script
random_script_filename = generate_random_filename()

# 5. Write the script content to the new file
with open(random_script_filename, 'w') as f:
    f.write(script_content)

print(f"Python script containing the filtered DataFrame has been saved as '{random_script_filename}'.")
print("The script will save the DataFrame to 'filtered_data.csv' when run.")