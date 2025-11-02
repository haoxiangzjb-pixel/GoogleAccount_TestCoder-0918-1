# Load CSV file and print summary statistics
# Read the CSV file (replace 'data.csv' with your actual file path)
data <- read.csv("data.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 rows:")
print(head(data))

# Print dimensions
print(paste("Dataset dimensions:", dim(data)[1], "rows and", dim(data)[2], "columns"))