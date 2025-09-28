# Load a CSV file and print summary statistics
# Assumes the CSV file is named 'data.csv' and is in the current working directory

# Load the CSV file into a data frame
data <- read.csv("data.csv")

# Print the structure of the data frame
print("Data Structure:")
str(data)

# Print summary statistics for each column
print("Summary Statistics:")
summary(data)