# R Script to Load CSV and Print Summary Statistics
# Generate a random data frame for demonstration

# Create sample data
set.seed(123)  # For reproducibility
data <- data.frame(
  ID = 1:100,
  Age = sample(18:80, 100, replace = TRUE),
  Income = round(rnorm(100, 50000, 15000)),
  Score = runif(100, 0, 100)
)

# Write to CSV file
write.csv(data, "sample_data.csv", row.names = FALSE)

# Load the CSV file
loaded_data <- read.csv("sample_data.csv")

# Print summary statistics
print("Summary Statistics:")
print(summary(loaded_data))

# Additional statistics
print("\nStandard Deviations:")
print(sapply(loaded_data[, sapply(loaded_data, is.numeric)], sd))

print("\nCorrelation Matrix:")
print(cor(loaded_data[, sapply(loaded_data, is.numeric)]))