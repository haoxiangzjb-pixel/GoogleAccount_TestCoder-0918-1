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

# Filter the DataFrame (e.g., people older than 25 with salary > 40000)
filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]
print("\nFiltered DataFrame (Age > 25 AND Salary > 40000):")
print(filtered_df)

# Generate a random filename
def generate_random_filename(length=10):
    letters = string.ascii_lowercase
    random_name = ''.join(random.choice(letters) for i in range(length))
    return random_name + ".py"

# Save the script to a randomly named .py file
random_filename = generate_random_filename()
print(f"\nSaving to file: {random_filename}")

# For demonstration, we'll save a simple representation of our results
with open(random_filename, 'w') as f:
    f.write("# DataFrame Filtering Script\n")
    f.write("import pandas as pd\n\n")
    f.write("# Original Data\n")
    f.write(f"data = {data}\n\n")
    f.write("df = pd.DataFrame(data)\n")
    f.write("# Filtered Data (Age > 25 AND Salary > 40000)\n")
    f.write("filtered_df = df[(df['Age'] > 25) & (df['Salary'] > 40000)]\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(filtered_df)\n")

print("Script saved successfully!")