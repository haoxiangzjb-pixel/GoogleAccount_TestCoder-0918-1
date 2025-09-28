# Load the data from the CSV file
# Assumes the CSV file is named 'data.csv' and is in the current working directory
data <- read.csv("data.csv")

# Print summary statistics for the dataset
print("Summary Statistics:")
print(summary(data))

# Optionally, print the structure of the data
print("Data Structure:")
print(str(data))