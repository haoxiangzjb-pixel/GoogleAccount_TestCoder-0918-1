# R script to create a scatter plot and save it

# Generate some random data
set.seed(42)  # For reproducible results
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Create the plot
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X values", ylab = "Y values")

# Save the plot as a PNG file
png("scatter_plot_output.png", width = 800, height = 600)
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X values", ylab = "Y values")
dev.off()

cat("Scatter plot saved as 'scatter_plot_output.png'\n")