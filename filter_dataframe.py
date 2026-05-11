import pandas as pd
import random
import string

# Create sample DataFrame
df = pd.DataFrame({
    'Product': ['Laptop', 'Mouse', 'Monitor', 'Keyboard', 'Headphones'],
    'Price': [999.99, 25.50, 299.00, 75.00, 199.99],
    'Stock': [50, 200, 30, 100, 75]
})

# Filter DataFrame (products with price > $100)
filtered_df = df[df['Price'] > 100]

# Generate random filename
random_name = ''.join(random.choices(string.ascii_lowercase + string.digits, k=12)) + '.py'

# Save filtered DataFrame to randomly named .py file
with open(random_name, 'w') as f:
    f.write("# Filtered DataFrame - Products with Price > $100\n")
    f.write("import pandas as pd\n\n")
    f.write("filtered_data = '''\n")
    f.write(filtered_df.to_string(index=False))
    f.write("\n'''\n")

print(f"Original DataFrame:")
print(df)
print(f"\nFiltered DataFrame (Price > $100):")
print(filtered_df)
print(f"\nSaved to: {random_name}")
