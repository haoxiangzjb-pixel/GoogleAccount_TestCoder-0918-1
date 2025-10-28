# R script to load CSV file and print summary statistics

# Load the CSV file
# Note: Replace 'your_file.csv' with the actual path to your CSV file
data <- read.csv("your_file.csv")

# Print basic information about the dataset
cat("Dataset dimensions:", dim(data), "\n")
cat("Column names:", names(data), "\n\n")

# Print summary statistics
cat("Summary statistics:\n")
print(summary(data))

# Print structure of the dataset
cat("\nDataset structure:\n")
str(data)

# Print first few rows
cat("\nFirst 6 rows:\n")
print(head(data))