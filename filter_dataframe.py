import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva', 'Frank', 'Grace', 'Henry'],
    'Age': [25, 30, 35, 28, 22, 40, 26, 33],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney', 'Berlin', 'Madrid', 'Rome'],
    'Salary': [50000, 60000, 70000, 55000, 45000, 80000, 52000, 68000]
}

df = pd.DataFrame(data)

print("Original DataFrame:")
print(df)
print("\n" + "="*50 + "\n")

# Filter the DataFrame: People with age less than 30
filtered_df = df[df['Age'] < 30]

print("Filtered DataFrame (Age < 30):")
print(filtered_df)
print("\n" + "="*50 + "\n")

# Generate a random filename
random_filename = 'filtered_data_' + ''.join(random.choices(string.ascii_lowercase + string.digits, k=8)) + '.py'

# Save the filtered DataFrame to the randomly named .py file
with open(random_filename, 'w') as file:
    file.write("# Filtered DataFrame saved to this file\n\n")
    file.write("import pandas as pd\n\n")
    file.write("# Data as a dictionary\n")
    file.write(f"filtered_data = {filtered_df.to_dict('records')}\n\n")
    file.write("# Convert to DataFrame\n")
    file.write("df_filtered = pd.DataFrame(filtered_data)\n\n")
    file.write("print('Filtered DataFrame:')\n")
    file.write("print(df_filtered)\n")

print(f"Filtered DataFrame saved to: {random_filename}")
print(f"Random filename: {random_filename}")