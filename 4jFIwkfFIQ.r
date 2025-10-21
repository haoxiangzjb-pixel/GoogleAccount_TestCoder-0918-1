# R script to load a CSV file and print summary statistics

# Load CSV file
# Replace 'your_file.csv' with the path to your actual CSV file
data <- read.csv("your_file.csv")

# Print basic summary statistics
print("Summary Statistics:")
print(summary(data))

# Print structure of the data
print("Data Structure:")
print(str(data))

# Print first few rows
print("First 6 rows:")
print(head(data))

# Additional statistics if the data contains numeric columns
print("Means of numeric columns:")
print(sapply(data, function(x) if(is.numeric(x)) mean(x, na.rm = TRUE) else NA))

print("Standard deviations of numeric columns:")
print(sapply(data, function(x) if(is.numeric(x)) sd(x, na.rm = TRUE) else NA))