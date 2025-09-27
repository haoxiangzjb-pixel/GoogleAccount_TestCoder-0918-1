# R script for scatter plot
# Filename: scatter_plot_1758950988904417770.R

# Generate random data
set.seed(42) # For reproducible results
x <- rnorm(100)
y <- rnorm(100)

# Create a png file for the plot
png("scatter_plot_output_1758950988904417770.png")

# Create the scatter plot
plot(x, y, main="Scatter Plot", xlab="X-axis", ylab="Y-axis")

# Close the png device to save the file
dev.off()

cat("Scatter plot saved as 'scatter_plot_output_1758950988904417770.png'\n")