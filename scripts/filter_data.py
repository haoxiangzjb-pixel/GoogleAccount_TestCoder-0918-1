import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 40, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., Age > 25)
filtered_df = df[df['Age'] > 25]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.py'

# Save the filtered DataFrame to the random .py file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame\n")
    f.write("filtered_data = " + filtered_df.to_string(index=False))

print(f"Filtered data saved to {random_filename}")
