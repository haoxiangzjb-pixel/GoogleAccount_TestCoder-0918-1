# Filtered DataFrame saved to this file

import pandas as pd

# Data from filtered DataFrame
filtered_data = {'Name': ['Bob', 'Charlie', 'David', 'Frank'], 'Age': [30, 35, 28, 33], 'City': ['London', 'Paris', 'Tokyo', 'Berlin'], 'Salary': [60000, 70000, 55000, 65000]}

# Convert to DataFrame
df_filtered = pd.DataFrame(filtered_data)
print('Filtered DataFrame:')
print(df_filtered)
