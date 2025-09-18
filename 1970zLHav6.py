# Python Script to Load CSV and Print Summary Statistics
import pandas as pd
import numpy as np
import random

# Set seed for reproducibility
random.seed(123)
np.random.seed(123)

# Create sample data
data = {
    'ID': range(1, 101),
    'Age': [random.randint(18, 80) for _ in range(100)],
    'Income': [round(np.random.normal(50000, 15000)) for _ in range(100)],
    'Score': [random.uniform(0, 100) for _ in range(100)]
}

# Create DataFrame
df = pd.DataFrame(data)

# Write to CSV file
df.to_csv("sample_data.csv", index=False)

# Load the CSV file
loaded_data = pd.read_csv("sample_data.csv")

# Print summary statistics
print("Summary Statistics:")
print(loaded_data.describe())

# Additional statistics
print("\nStandard Deviations:")
print(loaded_data.std(numeric_only=True))

print("\nCorrelation Matrix:")
print(loaded_data.corr(numeric_only=True))