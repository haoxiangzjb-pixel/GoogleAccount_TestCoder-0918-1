# Load the data from a CSV file
# Replace 'your_file.csv' with the path to your actual CSV file
data <- read.csv('your_file.csv')

# Print summary statistics for the dataset
print('Summary Statistics:')
print(summary(data))

# Print the structure of the dataset
print('Dataset Structure:')
print(str(data))

# Print the first few rows of the dataset
print('First 6 rows:')
print(head(data))