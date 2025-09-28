# R script to create a scatter plot and save it as a PNG file
# Generate some random data
set.seed(42)  # For reproducible results
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Create the scatter plot
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X values", ylab = "Y values")

# Save the plot to a file with a random name
file_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")
png(file_name)
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X values", ylab = "Y values")
dev.off()

cat("Scatter plot saved to file:", file_name, "\n")