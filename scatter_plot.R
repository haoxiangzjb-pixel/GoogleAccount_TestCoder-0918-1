# Script to generate a scatter plot and save it to a random filename

# Generate random data
set.seed(42) # For reproducibility
n <- 100
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 0.5) # y depends on x with some noise

# Create a random filename
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Create the plot
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X Variable", ylab = "Y Variable")

# Save the plot to the file
png(filename = random_name, width = 800, height = 600)
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X Variable", ylab = "Y Variable")
dev.off()

cat("Scatter plot saved to:", random_name, "\n")