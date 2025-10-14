import pandas as pd

# This script was generated automatically.
# Filtered DataFrame saved to 'filtered_data.csv'.

data = [{'Name': 'Bob', 'Age': 30, 'City': 'London'}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris'}, {'Name': 'David', 'Age': 28, 'City': 'Tokyo'}]
df = pd.DataFrame(data)
print("Filtered DataFrame:")
print(df)
df.to_csv('filtered_data.csv', index=False)
