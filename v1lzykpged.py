# Filtered DataFrame
import pandas as pd

# Data after filtering (Age > 28)
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Frank', 'Age': 32, 'City': 'Berlin', 'Salary': 65000}, {'Name': 'Grace', 'Age': 29, 'City': 'Madrid', 'Salary': 58000}, {'Name': 'Henry', 'Age': 31, 'City': 'Rome', 'Salary': 62000}]

# Convert back to DataFrame if needed
df_filtered = pd.DataFrame(filtered_data)
print('Filtered DataFrame:')
print(df_filtered)
