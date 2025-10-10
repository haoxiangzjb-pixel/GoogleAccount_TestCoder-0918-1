import pandas as pd

# Sample DataFrame
data = [{'Name': 'Bob', 'Age': 30, 'City': 'London'}, {'Name': 'Charlie', 'Age': 35, 'City': 'Paris'}, {'Name': 'David', 'Age': 28, 'City': 'Tokyo'}]
df = pd.DataFrame(data)

print("Filtered DataFrame:")
print(df)

# Save the filtered DataFrame to a CSV file (optional)
# df.to_csv('filtered_data.csv', index=False)
