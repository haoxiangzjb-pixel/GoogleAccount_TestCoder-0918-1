# Load CSV file and print summary statistics
# This script loads a CSV file and prints summary statistics

# Load the CSV file
# Replace "data.csv" with the path to your CSV file
data <- read.csv("data.csv")

# Print the structure of the data
print("Data Structure:")
str(data)

# Print summary statistics
print("Summary Statistics:")
summary(data)

# Print dimensions of the data
print(paste("Data Dimensions:", dim(data)[1], "rows and", dim(data)[2], "columns"))

# Print first 6 rows
print("First 6 rows:")
head(data)

# Print column names
print("Column Names:")
print(names(data))