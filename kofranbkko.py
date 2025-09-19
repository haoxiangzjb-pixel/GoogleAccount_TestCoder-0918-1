import pandas as pd

# Filtered data
filtered_data = {
    'Name': ['Bob', 'David'],
    'Age': [32, 47],
    'City': ['London', 'Tokyo'],
    'Salary': [85000, 120000]
}

filtered_df = pd.DataFrame(filtered_data)
print("Filtered DataFrame (Age > 25 and Salary > 60000):")
print(filtered_df)
