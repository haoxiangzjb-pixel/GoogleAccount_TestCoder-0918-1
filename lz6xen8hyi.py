# This file was generated with filtered data
import pandas as pd

# Filtered DataFrame (Age > 29)
filtered_data = {'Name': {1: 'Bob', 2: 'Charlie', 4: 'Eve', 6: 'Grace'}, 'Age': {1: 30, 2: 35, 4: 32, 6: 31}, 'City': {1: 'London', 2: 'Paris', 4: 'Sydney', 6: 'Madrid'}, 'Salary': {1: 60000, 2: 70000, 4: 65000, 6: 68000}}

# Convert back to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from lz6xen8hyi.py:")
print(filtered_df)
