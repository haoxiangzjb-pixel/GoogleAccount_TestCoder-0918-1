#!/usr/bin/env python3
# Python Script for Loading CSV and Printing Summary Statistics

import pandas as pd
import numpy as np

# Create sample data (in practice, you would load from a CSV file)
data = pd.DataFrame({
    'ID': range(1, 21),
    'Name': [f'Person_{i}' for i in range(1, 21)],
    'Age': np.random.randint(18, 66, 20),
    'Score': np.round(np.random.uniform(50, 100, 20), 1),
    'Category': np.random.choice(['A', 'B', 'C'], 20)
})

# Save sample data to CSV
data.to_csv('sample_data.csv', index=False)

# Load the data from CSV
data = pd.read_csv('sample_data.csv')

# Print summary statistics
print("=== Summary Statistics ===")
print(data.describe())

# Print structure of the data
print("\n=== Data Structure ===")
print(data.info())

# Print first few rows
print("\n=== First few rows ===")
print(data.head())

# Additional statistics
print("\n=== Additional Statistics ===")
# For numeric columns only
numeric_data = data.select_dtypes(include=[np.number])
if not numeric_data.empty:
    print("Standard Deviation:")
    print(numeric_data.std())
    
    print("\nVariance:")
    print(numeric_data.var())