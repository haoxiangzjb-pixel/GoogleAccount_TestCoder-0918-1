# Filtered DataFrame saved to this file
import pandas as pd

data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Eve', 'Age': 32, 'City': 'Sydney', 'Salary': 65000}]
filtered_data = pd.DataFrame(data)
print('Filtered data:')
print(filtered_data)
