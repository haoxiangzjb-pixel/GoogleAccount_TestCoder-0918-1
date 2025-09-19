import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 32, 18, 47, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [70000, 85000, 50000, 120000, 65000]
}

df = pd.DataFrame(data)
print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 25 with salary > 60000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 60000)]

print("\nFiltered DataFrame (Age > 25 and Salary > 60000):")
print(filtered_df)

# Generate a random filename
def generate_random_filename():
    letters = string.ascii_lowercase
    random_string = ''.join(random.choice(letters) for i in range(10))
    return f"{random_string}.py"

# Save the script to a randomly named .py file
filename = generate_random_filename()

# For demonstration, we'll save a simple script that just contains our filtered data
# In a real scenario, you might save just the data or results
script_content = '''import pandas as pd

# Filtered data
filtered_data = {
    'Name': ['Bob', 'David'],
    'Age': [32, 47],
    'City': ['London', 'Tokyo'],
    'Salary': [85000, 120000]
}

filtered_df = pd.DataFrame(filtered_data)
print("Filtered DataFrame (Age > 25 and Salary > 60000):")
print(filtered_df)
'''

with open(filename, 'w') as f:
    f.write(script_content)

print(f"\nScript saved to {filename}")