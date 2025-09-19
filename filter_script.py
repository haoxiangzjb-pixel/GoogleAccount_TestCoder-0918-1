import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 75000, 30000, 90000, 45000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 25 with salary > 40000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]

print("\nFiltered DataFrame (Age > 25 and Salary > 40000):")
print(filtered_df)

# Generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return random_name + '.py'

# Save the filtered DataFrame to a new Python file
filename = generate_random_filename()

# Create the content for the new file
file_content = f"""
import pandas as pd

# Filtered DataFrame
data = {filtered_df.to_dict('records')}
filtered_df = pd.DataFrame(data)

print("Filtered DataFrame loaded from file:")
print(filtered_df)
"""

# Write to the randomly named file
with open(filename, 'w') as f:
    f.write(file_content)

print(f"\nFiltered DataFrame saved to: {filename}")