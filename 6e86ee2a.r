# R Script to Load CSV and Print Summary Statistics
# Generate a random CSV file name
csv_file <- "data.csv"

# Check if the CSV file exists
if (!file.exists(csv_file)) {
  # If not, create a sample dataset
  set.seed(123)  # For reproducibility
  sample_data <- data.frame(
    ID = 1:100,
    Age = sample(18:80, 100, replace = TRUE),
    Income = sample(20000:150000, 100, replace = TRUE),
    Score = rnorm(100, mean = 75, sd = 10)
  )
  
  # Write the sample data to a CSV file
  write.csv(sample_data, csv_file, row.names = FALSE)
  cat("Sample CSV file created:", csv_file, "\n")
}

# Load the CSV file
data <- read.csv(csv_file)

# Print summary statistics
cat("Summary Statistics:\n")
print(summary(data))

# Additional statistics
cat("\nStandard Deviations:\n")
print(sapply(data[sapply(data, is.numeric)], sd))

cat("\nData Structure:\n")
str(data)

cat("\nFirst few rows:\n")
print(head(data))