import pandas as pd
import random
import string

# Create a sample DataFrame for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank'],
    'Age': [25, 30, 35, 28, 32, 27],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 58000]
}
df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print("\n")

# Filter the DataFrame - for example, people older than 29
filtered_df = df[df['Age'] > 29]

print("Filtered DataFrame (Age > 29):")
print(filtered_df)

# Save the filtered DataFrame to a CSV file
filtered_df.to_csv('filtered_data.csv', index=False)
print("\nFiltered data saved to 'filtered_data.csv'")

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
print(f"Random filename generated: {random_filename}")

# Save this script with a random name
with open(random_filename, 'w') as f:
    f.write('''import pandas as pd
import random
import string

# Create a sample DataFrame for demonstration
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve', 'Frank'],
    'Age': [25, 30, 35, 28, 32, 27],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000, 58000]
}
df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print("\\n")

# Filter the DataFrame - for example, people older than 29
filtered_df = df[df['Age'] > 29]

print("Filtered DataFrame (Age > 29):")
print(filtered_df)

# Save the filtered DataFrame to a CSV file
filtered_df.to_csv('filtered_data.csv', index=False)
print("\\nFiltered data saved to 'filtered_data.csv'")

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'
print(f"Random filename generated: {random_filename}")
''')

print(f"Script saved with random name: {random_filename}")