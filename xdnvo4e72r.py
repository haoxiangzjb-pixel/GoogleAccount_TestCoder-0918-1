import pandas as pd

# Generated DataFrame filtering script
data = {'Name': ['Alice', 'Bob', 'Charlie', 'David', 'Eve'], 'Age': [25, 35, 45, 30, 29], 'City': ['New York', 'Los Angeles', 'New York', 'Chicago', 'Chicago'], 'Salary': [50000, 60000, 70000, 65000, 55000]}
df = pd.DataFrame(data)
filtered_df = df[df['Age'] > 30]

print("Filtered DataFrame (Age > 30):")
print(filtered_df)

# Save the filtered DataFrame to a CSV file (optional)
# filtered_df.to_csv('filtered_output.csv', index=False)
