import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'name': ['Alice', 'Bob', 'Charlie', 'David', 'Eva'],
    'age': [25, 32, 18, 47, 22],
    'city': ['New York', 'London', 'Paris', 'Tokyo', 'Berlin']
}
df = pd.DataFrame(data)

# Filter the DataFrame (e.g., people older than 21)
filtered_df = df[df['age'] > 21]

# Display results
print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (age > 21):")
print(filtered_df)