# Load CSV file and print summary statistics
# Read the CSV file (assuming it's in the current directory)
data <- read.csv("data.csv")

# Print the structure of the data
str(data)

# Print summary statistics
summary(data)

# Print the first few rows
head(data)