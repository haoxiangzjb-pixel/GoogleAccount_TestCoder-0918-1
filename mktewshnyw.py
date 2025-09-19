
import pandas as pd

# Filtered DataFrame
data = [{'Name': 'Bob', 'Age': 32, 'City': 'London', 'Salary': 75000}, {'Name': 'David', 'Age': 47, 'City': 'Tokyo', 'Salary': 90000}]
filtered_df = pd.DataFrame(data)

print("Filtered DataFrame loaded from file:")
print(filtered_df)
