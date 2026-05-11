# R Script to load a CSV file and print summary statistics

# Get the CSV file path from command line arguments
args <- commandArgs(trailingOnly = TRUE)

if (length(args) == 0) {
  stop("Usage: Rscript <script_name>.r <path_to_csv_file>")
}

csv_file <- args[1]

# Check if file exists
if (!file.exists(csv_file)) {
  stop(paste("File not found:", csv_file))
}

# Load the CSV file
data <- read.csv(csv_file, stringsAsFactors = FALSE)

# Print dataset dimensions
cat("=== Dataset Dimensions ===\n")
cat(paste("Rows:", nrow(data), "\n"))
cat(paste("Columns:", ncol(data), "\n\n"))

# Print column names and types
cat("=== Column Information ===\n")
str(data)
cat("\n")

# Print summary statistics
cat("=== Summary Statistics ===\n")
print(summary(data))

# Print additional statistics for numeric columns
numeric_cols <- sapply(data, is.numeric)
if (any(numeric_cols)) {
  cat("\n=== Detailed Numeric Statistics ===\n")
  numeric_data <- data[, numeric_cols, drop = FALSE]
  
  stats_summary <- data.frame(
    Mean = sapply(numeric_data, function(x) mean(x, na.rm = TRUE)),
    Median = sapply(numeric_data, function(x) median(x, na.rm = TRUE)),
    SD = sapply(numeric_data, function(x) sd(x, na.rm = TRUE)),
    Min = sapply(numeric_data, function(x) min(x, na.rm = TRUE)),
    Max = sapply(numeric_data, function(x) max(x, na.rm = TRUE)),
    Q1 = sapply(numeric_data, function(x) quantile(x, 0.25, na.rm = TRUE)),
    Q3 = sapply(numeric_data, function(x) quantile(x, 0.75, na.rm = TRUE))
  )
  
  print(round(stats_summary, 4))
}

# Print missing value counts
cat("\n=== Missing Values per Column ===\n")
missing_counts <- sapply(data, function(x) sum(is.na(x)))
print(missing_counts)

cat("\nAnalysis complete!\n")
