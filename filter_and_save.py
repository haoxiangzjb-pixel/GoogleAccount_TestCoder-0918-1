import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 28, 32],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin'],
    'Salary': [50000, 60000, 70000, 55000, 65000]
}
df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)

# Filter the DataFrame (example: people older than 30)
filtered_df = df[df['Age'] > 30]

print("\nFiltered DataFrame (Age > 30):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save Python code to recreate the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame code\n")
    f.write("import pandas as pd\n\n")
    f.write("# Data for filtered DataFrame\n")
    f.write(f"data = {filtered_df.to_dict('list')}\n")
    f.write("filtered_df = pd.DataFrame(data)\n")
    f.write("print(filtered_df)\n")

print(f"\nPython code to recreate filtered DataFrame saved to: {random_filename}")