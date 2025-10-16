# Load CSV file and print summary statistics
# This script loads a CSV file and prints summary statistics

# Load the CSV file (replace 'data.csv' with your actual file path)
# The header parameter assumes the first row contains column names
data <- read.csv("data.csv", header = TRUE)

# Print basic information about the dataset
cat("Dataset dimensions:", dim(data), "\n")
cat("Column names:", names(data), "\n\n")

# Print summary statistics for all columns
cat("Summary statistics:\n")
print(summary(data))

# Print additional statistics for numeric columns
numeric_cols <- sapply(data, is.numeric)
if(any(numeric_cols)) {
  cat("\nAdditional statistics for numeric columns:\n")
  numeric_data <- data[numeric_cols]
  
  # Mean, median, standard deviation for numeric columns
  means <- sapply(numeric_data, mean, na.rm = TRUE)
  medians <- sapply(numeric_data, median, na.rm = TRUE)
  sds <- sapply(numeric_data, sd, na.rm = TRUE)
  
  cat("Means:\n")
  print(means)
  cat("Medians:\n")
  print(medians)
  cat("Standard deviations:\n")
  print(sds)
}

# Print the first few rows of the dataset
cat("\nFirst 6 rows of the dataset:\n")
print(head(data))