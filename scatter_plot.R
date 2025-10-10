# R script to generate a scatter plot and save it as a PNG file with a random name

# Load required library (ggplot2 for enhanced plotting, though base R is sufficient here)
# install.packages("ggplot2") # Uncomment if ggplot2 is not installed
# library(ggplot2)

# Generate random data
set.seed(42) # For reproducible results during testing
n <- 100
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 0.5)

# Create a basic scatter plot
# plot(x, y, main = "Scatter Plot of Random Data", xlab = "X Variable", ylab = "Y Variable")

# Alternatively, using ggplot2 (uncomment the lines below if you prefer ggplot2)
# df <- data.frame(x = x, y = y)
# p <- ggplot(df, aes(x = x, y = y)) +
#   geom_point() +
#   labs(title = "Scatter Plot of Random Data", x = "X Variable", y = "Y Variable")
# print(p)

# Generate a random filename
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Save the plot as a PNG file
png(filename = random_name, width = 800, height = 600)

# Create the plot inside the png device
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X Variable", ylab = "Y Variable")

# Close the png device to save the file
dev.off()

cat("Scatter plot saved as:", random_name, "\n")