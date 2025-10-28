# Generated script with filtered DataFrame
import pandas as pd

# Filtered DataFrame saved as a dictionary
filtered_data = [{'Name': 'Bob', 'Age': 30, 'City': 'London', 'Salary': 60000}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris', 'Salary': 70000}, {'Name': 'Diana', 'Age': 28, 'City': 'Tokyo', 'Salary': 55000}, {'Name': 'Frank', 'Age': 40, 'City': 'Berlin', 'Salary': 80000}, {'Name': 'Grace', 'Age': 33, 'City': 'Madrid', 'Salary': 65000}, {'Name': 'Henry', 'Age': 27, 'City': 'Rome', 'Salary': 58000}]

# Convert back to DataFrame
filtered_df = pd.DataFrame(filtered_data)

print("Filtered DataFrame loaded from saved file:")
print(filtered_df)
