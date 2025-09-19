# R Script for Loading CSV and Printing Summary Statistics

# Load necessary library
# install.packages("readr") # Uncomment if you need to install the package
library(readr)

# Load CSV file (replace 'data.csv' with your actual file path)
# For demonstration purposes, we'll create a sample dataset
# In practice, you would use: data <- read_csv("your_file.csv")
data <- data.frame(
  ID = 1:20,
  Name = paste("Person", 1:20),
  Age = sample(18:65, 20, replace = TRUE),
  Score = round(runif(20, 50, 100), 1),
  Category = sample(c("A", "B", "C"), 20, replace = TRUE)
)

# Save sample data to CSV (optional)
write.csv(data, "sample_data.csv", row.names = FALSE)

# Load the data from CSV
data <- read_csv("sample_data.csv")

# Print summary statistics
print("=== Summary Statistics ===")
print(summary(data))

# Print structure of the data
print("=== Data Structure ===")
print(str(data))

# Print first few rows
print("=== First few rows ===")
print(head(data))

# Additional statistics
print("=== Additional Statistics ===")
# For numeric columns only
numeric_data <- data[sapply(data, is.numeric)]
if(ncol(numeric_data) > 0) {
  print("Standard Deviation:")
  print(apply(numeric_data, 2, sd, na.rm = TRUE))
  
  print("Variance:")
  print(apply(numeric_data, 2, var, na.rm = TRUE))
}