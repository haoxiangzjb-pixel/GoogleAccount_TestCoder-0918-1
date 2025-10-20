# R script to create a scatter plot and save it as a PNG file

# Generate random data for the scatter plot
set.seed(123)  # For reproducible results
x <- rnorm(100)
y <- rnorm(100)

# Create a scatter plot
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X-axis", 
     ylab = "Y-axis", 
     pch = 19,  # Solid circles
     col = "blue")

# Save the plot as a PNG file with a random name
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")
png(random_name, width = 800, height = 600)
plot(x, y, 
     main = "Scatter Plot", 
     xlab = "X-axis", 
     ylab = "Y-axis", 
     pch = 19, 
     col = "blue")
dev.off()

cat("Scatter plot saved as", random_name, "\n")