import pandas as pd
import random
import string

# Create a sample DataFrame
data = {
    'Product': ['Laptop', 'Mouse', 'Keyboard', 'Monitor', 'Headphones', 'Webcam'],
    'Price': [999.99, 29.99, 79.99, 349.99, 149.99, 89.99],
    'Stock': [50, 200, 150, 75, 100, 60],
    'Category': ['Electronics', 'Accessories', 'Accessories', 'Electronics', 'Audio', 'Electronics']
}

df = pd.DataFrame(data)

# Filter the DataFrame: products with price greater than $100
filtered_df = df[df['Price'] > 100]

print("Original DataFrame:")
print(df)
print("\nFiltered DataFrame (Price > $100):")
print(filtered_df)

# Generate a random filename
random_filename = ''.join(random.choices(string.ascii_lowercase + string.digits, k=12)) + '.py'

# Save the filtered DataFrame to the randomly named file
with open(random_filename, 'w') as f:
    f.write("# Filtered DataFrame - Auto-generated script\n\n")
    f.write("import pandas as pd\n\n")
    f.write("# Filtered data\n")
    f.write(f"data = {filtered_df.to_dict(orient='list')}\n\n")
    f.write("df = pd.DataFrame(data)\n")
    f.write("print('Filtered DataFrame:')\n")
    f.write("print(df)\n")

print(f"\nFiltered DataFrame saved to {random_filename}")
