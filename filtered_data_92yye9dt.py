# This file was generated with filtered data
import pandas as pd

# Filtered DataFrame (Age > 28)
data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Frank', 'Age': 33, 'City': 'Berlin', 'Salary': 65000}, {'Name': 'Grace', 'Age': 29, 'City': 'Madrid', 'Salary': 58000}, {'Name': 'Henry', 'Age': 31, 'City': 'Rome', 'Salary': 62000}]

# Create DataFrame from the filtered data
filtered_df = pd.DataFrame(data)
print("Filtered DataFrame loaded from this file:")
print(filtered_df)
