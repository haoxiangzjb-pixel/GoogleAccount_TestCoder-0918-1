# Filtered DataFrame code
import pandas as pd

# Recreating the filtered DataFrame
data = {
    'Name': ['Bob', 'David'],
    'Age': [32, 47],
    'City': ['London', 'Tokyo'],
    'Salary': [75000, 90000]
}

filtered_df = pd.DataFrame(data)
print(filtered_df)
