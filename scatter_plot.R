# Script to generate a scatter plot and save it to a file with a random name
# Load necessary library (ggplot2 is popular, but base R is sufficient here)
# library(ggplot2) # Uncomment if you prefer ggplot2

# Generate random data
set.seed(42) # For reproducible results
n_points <- 100
x_data <- rnorm(n_points)
y_data <- x_data + rnorm(n_points, sd = 0.5) # y is roughly x plus some noise

# Create the plot
plot(x_data, y_data, main = "Scatter Plot of Random Data", xlab = "X Values", ylab = "Y Values")

# Generate a random filename
# Using a simple method with current time and a random number
random_suffix <- paste0(sample(c(0:9, letters, LETTERS), 8, replace = TRUE), collapse = "")
plot_filename <- paste0("scatter_plot_", random_suffix, ".png")

# Save the plot as a PNG file
png(filename = plot_filename, width = 800, height = 600)
plot(x_data, y_data, main = "Scatter Plot of Random Data", xlab = "X Values", ylab = "Y Values")
dev.off()

cat("Scatter plot created and saved as:", plot_filename, "\n")