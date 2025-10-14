# Load a CSV file and print summary statistics
# Assumes the CSV file is named 'data.csv' and is in the current working directory

# Load the data
data <- read.csv("data.csv")

# Print the structure of the data
print("Data Structure:")
str(data)

# Print summary statistics
print("Summary Statistics:")
summary(data)