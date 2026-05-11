# R Script to load a CSV file and print summary statistics

# Load the CSV file
# Replace 'data.csv' with your actual file path or use command line arguments
args <- commandArgs(trailingOnly = TRUE)

if (length(args) >= 1) {
  csv_file <- args[1]
} else {
  csv_file <- "data.csv"  # Default file name
}

# Check if file exists
if (!file.exists(csv_file)) {
  stop(paste("File not found:", csv_file))
}

# Load the CSV file
data <- read.csv(csv_file)

# Print summary statistics
cat("=== Summary Statistics ===\n\n")

# Basic structure
cat("Data Structure:\n")
str(data)
cat("\n")

# Summary of each column
cat("Column Summaries:\n")
print(summary(data))
cat("\n")

# Additional statistics for numeric columns
numeric_cols <- sapply(data, is.numeric)
if (any(numeric_cols)) {
  cat("Numeric Column Statistics:\n")
  numeric_data <- data[, numeric_cols, drop = FALSE]
  
  for (col in names(numeric_data)) {
    cat(sprintf("\n%s:\n", col))
    cat(sprintf("  Mean: %.2f\n", mean(numeric_data[[col]], na.rm = TRUE)))
    cat(sprintf("  Median: %.2f\n", median(numeric_data[[col]], na.rm = TRUE)))
    cat(sprintf("  SD: %.2f\n", sd(numeric_data[[col]], na.rm = TRUE)))
    cat(sprintf("  Min: %.2f\n", min(numeric_data[[col]], na.rm = TRUE)))
    cat(sprintf("  Max: %.2f\n", max(numeric_data[[col]], na.rm = TRUE)))
    cat(sprintf("  Q1: %.2f\n", quantile(numeric_data[[col]], 0.25, na.rm = TRUE)))
    cat(sprintf("  Q3: %.2f\n", quantile(numeric_data[[col]], 0.75, na.rm = TRUE)))
  }
}

# Count of rows and columns
cat("\n=== Dataset Dimensions ===\n")
cat(sprintf("Rows: %d\n", nrow(data)))
cat(sprintf("Columns: %d\n", ncol(data)))

# Missing values
cat("\n=== Missing Values ===\n")
missing_counts <- colSums(is.na(data))
print(missing_counts)

cat("\n=== Analysis Complete ===\n")
