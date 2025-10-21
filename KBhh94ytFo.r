# R script to load a CSV file and print summary statistics

# Load the CSV file
# Replace 'your_file.csv' with the actual path to your CSV file
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

# Print dimensions
print(paste("Data Dimensions:", dim(data)[1], "rows and", dim(data)[2], "columns"))

# Additional statistics for numeric columns
numeric_cols <- sapply(data, is.numeric)
if(any(numeric_cols)) {
  print("Additional Statistics for Numeric Columns:")
  print(sapply(data[numeric_cols], function(x) c(
    Mean = mean(x, na.rm = TRUE),
    Median = median(x, na.rm = TRUE),
    SD = sd(x, na.rm = TRUE),
    Min = min(x, na.rm = TRUE),
    Max = max(x, na.rm = TRUE)
  )))
}