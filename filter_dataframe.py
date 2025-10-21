import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 33, 29, 31],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 65000, 58000, 62000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)
print()

# Filter the DataFrame (e.g., people older than 28)
filtered_df = df[df['Age'] > 28]
print("Filtered DataFrame (Age > 28):")
print(filtered_df)
print()

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Create content to save in the new file
file_content = f"""# This file was generated with filtered data
import pandas as pd

# Filtered DataFrame (Age > 28)
data = {filtered_df.to_dict('records')}

# Create DataFrame from the filtered data
filtered_df = pd.DataFrame(data)
print("Filtered DataFrame loaded from this file:")
print(filtered_df)
"""

# Save the filtered DataFrame to the randomly named file
with open(random_filename, 'w') as f:
    f.write(file_content)

print(f"Filtered DataFrame saved to: {random_filename}")