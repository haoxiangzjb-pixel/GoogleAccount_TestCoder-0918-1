import pandas as pd
import numpy as np
import os
import random

# Generate a random CSV file name
csv_file = "data.csv"

# Check if the CSV file exists
if not os.path.exists(csv_file):
    # If not, create a sample dataset
    np.random.seed(123)  # For reproducibility
    sample_data = pd.DataFrame({
        'ID': range(1, 101),
        'Age': np.random.randint(18, 81, 100),
        'Income': np.random.randint(20000, 150001, 100),
        'Score': np.random.normal(75, 10, 100)
    })
    
    # Write the sample data to a CSV file
    sample_data.to_csv(csv_file, index=False)
    print(f"Sample CSV file created: {csv_file}")

# Load the CSV file
data = pd.read_csv(csv_file)

# Print summary statistics
print("Summary Statistics:")
print(data.describe())

# Additional statistics
print("\nData Info:")
print(data.info())

print("\nFirst few rows:")
print(data.head())