# Load CSV file and print summary statistics

# Specify the path to your CSV file
# For this example, we'll assume the file is named 'data.csv'
# Replace 'data.csv' with the actual path to your file
csv_file <- "data.csv"

# Load the CSV file into a data frame
data <- read.csv(csv_file)

# Print the structure of the data
print("Data Structure:")
str(data)

# Print summary statistics
print("Summary Statistics:")
summary(data)