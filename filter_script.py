import pandas as pd
import random
import string
import os

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 27, 32, 29, 31],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 52000, 65000, 58000, 62000]
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., people older than 28)
filtered_df = df[df['Age'] > 28]

# Generate a random filename
def generate_random_filename():
    random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_name}.py"

# Save the filtered DataFrame to a randomly named .py file
random_filename = generate_random_filename()

# Write the filtered DataFrame to the file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data after filtering (Age > 28)\n")
    f.write(f"filtered_data = {filtered_df.to_dict('records')}\n")
    f.write("\n# Convert back to DataFrame if needed\n")
    f.write("df_filtered = pd.DataFrame(filtered_data)\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(df_filtered)\n")

print(f"Filtered DataFrame saved to {random_filename}")
print("\nOriginal DataFrame:")
print(df)
print("\nFiltered DataFrame (Age > 28):")
print(filtered_df)