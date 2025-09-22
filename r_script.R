# R Script to Load CSV and Print Summary Statistics
# Generate a random CSV file name (assuming it exists)
csv_file <- "sample_data.csv"

# Load the CSV file
data <- read.csv(csv_file)

# Print summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 Rows:")
print(head(data))