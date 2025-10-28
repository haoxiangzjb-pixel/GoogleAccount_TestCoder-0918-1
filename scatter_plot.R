# R script to create a scatter plot and save it with a random filename
# Generate some sample data
set.seed(42)  # For reproducible results
x <- rnorm(100, mean = 50, sd = 15)
y <- 2 * x + rnorm(100, mean = 0, sd = 10)  # Linear relationship with some noise

# Create a random filename
random_string <- paste(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
plot_filename <- paste0("scatter_plot_", random_string, ".png")

# Create the scatter plot
png(plot_filename, width = 800, height = 600)  # Save as PNG with specified dimensions
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X Variable", 
     ylab = "Y Variable",
     pch = 19,  # Solid circles
     col = rgb(0.2, 0.4, 0.6, alpha = 0.6),  # Semi-transparent blue points
     cex = 1.2)  # Point size

# Add a trend line
abline(lm(y ~ x), col = "red", lwd = 2)

# Close the PNG device to save the file
dev.off()

cat("Scatter plot saved as:", plot_filename, "\n")