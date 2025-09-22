# R Script to Load CSV and Print Summary Statistics
# Generated on September 23, 2025

# Load necessary library
# install.packages("readr") # Uncomment if you need to install the package
library(readr)

# Load the CSV file (replace 'data.csv' with your actual file path)
# For this example, we'll create a sample dataset
data <- read_csv("data.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First few rows:")
print(head(data))