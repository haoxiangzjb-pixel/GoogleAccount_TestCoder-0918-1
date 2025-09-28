import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'Age': [25, 30, 35, 40, 22],
    'City': ['New York', 'London', 'Paris', 'Tokyo', 'Sydney']
}
df = pd.DataFrame(data)

# Filter the DataFrame (example: Age greater than 26)
filtered_df = df[df['Age'] > 26]

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10)) + '.csv'

# Save the filtered DataFrame to the random file
filtered_df.to_csv(random_filename, index=False)

print(f"Filtered DataFrame saved to {random_filename}")
print(filtered_df)
