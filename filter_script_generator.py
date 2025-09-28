import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney'],
    'Salary': [50000, 60000, 70000, 55000, 48000]
}
df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# Filter the DataFrame (e.g., age greater than 25)
filtered_df = df[df['Age'] > 25]

print("\nFiltered DataFrame (Age > 25):")
print(filtered_df)

# Generate a random filename
random_filename = "filtered_data_" + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + ".py"

# Content for the new Python file
script_content = f'''import pandas as pd

# Filtered data saved from original script
data = {filtered_df.to_dict('records')}
filtered_df = pd.DataFrame(data)

print("Filtered DataFrame loaded from {random_filename}:")
print(filtered_df)
'''

# Write the filtered data and script to the new file
with open(random_filename, 'w') as f:
    f.write(script_content)

print(f"\nFiltered DataFrame saved to {random_filename}")