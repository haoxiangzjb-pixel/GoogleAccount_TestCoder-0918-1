# Generate random data
set.seed(123) # For reproducibility
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# Create the bar plot
barplot(values, names.arg = categories, col = "skyblue", 
        main = "Random Bar Chart", xlab = "Categories", ylab = "Values")

# Save the plot to a file (filename will be handled by the execution environment)
# The script itself is saved in a randomly named .r file.