# R script to load a CSV file and print summary statistics

# Load the CSV file
# Note: You'll need to specify the correct path to your CSV file
csv_file <- "your_data.csv"  # Replace with your actual CSV file path
data <- read.csv(csv_file)

# Print basic information about the dataset
cat("Dataset dimensions:", dim(data), "\n")
cat("Column names:", names(data), "\n\n")

# Print summary statistics
print(summary(data))

# Print structure of the dataset
str(data)

# Additional statistics for numeric columns
if(any(sapply(data, is.numeric))) {
  cat("\nAdditional statistics for numeric columns:\n")
  numeric_data <- data[sapply(data, is.numeric)]
  print(sapply(numeric_data, function(x) c(
    Mean = mean(x, na.rm = TRUE),
    Median = median(x, na.rm = TRUE),
    SD = sd(x, na.rm = TRUE),
    Min = min(x, na.rm = TRUE),
    Max = max(x, na.rm = TRUE)
  )))
}