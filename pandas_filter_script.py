import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 33, 27, 31],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Rome', 'Madrid'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 65000, 52000, 68000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print("\n" + "="*50 + "\n")

# Filter the DataFrame: People older than 28
filtered_df = df[df['Age'] > 28]

print("Filtered DataFrame (Age > 28):")
print(filtered_df)
print("\n" + "="*50 + "\n")

# Additional filter: People with salary > 55000
high_earners = df[df['Salary'] > 55000]

print("High earners (Salary > 55000):")
print(high_earners)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to a new Python file
with open(random_filename, 'w') as f:
    f.write(f"# This file was generated with filtered data\n")
    f.write(f"# Filtered DataFrame (Age > 28)\n")
    f.write(f"filtered_data = {filtered_df.to_dict(orient='records')}\n")
    f.write(f"\n# High earners (Salary > 55000)\n")
    f.write(f"high_earners_data = {high_earners.to_dict(orient='records')}\n")

print(f"\nFiltered data saved to: {random_filename}")