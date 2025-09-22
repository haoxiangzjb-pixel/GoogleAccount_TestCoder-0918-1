# R Script to Load CSV and Print Summary Statistics
# Generated on 2025-09-23

# Load necessary libraries
# If any libraries are needed, they would be loaded here
# library(readr)  # Example: for read_csv function

# Load the CSV file
# Replace 'data.csv' with the path to your actual CSV file
data <- read.csv("data.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 Rows:")
print(head(data))