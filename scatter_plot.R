# R script to create a scatter plot and save it with a random filename

# Generate some random data
set.seed(42) # For reproducibility of the example, not for the filename
x <- runif(100, min = 0, max = 100)
y <- runif(100, min = 0, max = 100)

# Create a random filename
# Using letters and numbers for the random part
random_id <- paste0(sample(c(letters, 0:9), 10, replace = TRUE), collapse = "")
filename <- paste0("/workspace/scatter_plot_", random_id, ".png")

# Open a PNG graphics device with the random filename
png(filename, width = 800, height = 600)

# Create the scatter plot
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X values", ylab = "Y values", pch = 19, col = "blue")

# Close the graphics device, which saves the file
dev.off()

# Print the name of the created file
cat("Scatter plot saved as:", filename, "\n")