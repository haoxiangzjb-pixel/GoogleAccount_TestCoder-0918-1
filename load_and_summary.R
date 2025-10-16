# Load CSV file and print summary statistics

# Specify the path to your CSV file
# Replace 'your_file.csv' with the actual path to your CSV file
csv_file_path <- "your_file.csv"

# Load the CSV file into a data frame
data <- read.csv(csv_file_path)

# Print the first few rows of the data frame
print("First 6 rows of the data:")
print(head(data))

# Print summary statistics for each column
print("Summary statistics:")
print(summary(data))