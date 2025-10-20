# R script to load a CSV file and print summary statistics

# Load required library (if needed for advanced summaries)
# library(summary)

# Function to load CSV and print summary statistics
analyze_csv <- function(file_path) {
  # Load the CSV file
  data <- read.csv(file_path, header = TRUE, stringsAsFactors = FALSE)
  
  # Print basic information about the dataset
  cat("Dataset dimensions:", dim(data), "\n")
  cat("Column names:", names(data), "\n\n")
  
  # Print summary statistics
  cat("Summary statistics:\n")
  print(summary(data))
  
  # Print structure of the dataset
  cat("\nDataset structure:\n")
  str(data)
  
  # Print first few rows
  cat("\nFirst 6 rows:\n")
  print(head(data))
  
  return(data)
}

# Example usage (uncomment the line below and provide your CSV file path)
# analyze_csv("your_file.csv")