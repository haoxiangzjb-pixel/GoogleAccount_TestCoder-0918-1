import pandas as pd
import random
import string

def generate_random_filename():
    """Generates a random filename with a .py extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.py"

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'],
    'Age': [25, 30, 35, 28, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
filename = generate_random_filename()

# Create the script content as a string
script_content = f'''import pandas as pd

# Sample DataFrame
data = {filtered_df.to_dict('records')}
df = pd.DataFrame(data)

print("Filtered DataFrame:")
print(df)

# Save the filtered DataFrame to a CSV file (optional)
# df.to_csv('filtered_data.csv', index=False)
'''

# Write the script content to the randomly named file
with open(filename, 'w') as f:
    f.write(script_content)

print(f"Python script created: {filename}")