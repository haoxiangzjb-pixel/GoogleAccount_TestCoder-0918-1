# R script for scatter plot

# Load required library (usually not needed for base plots)
# library(ggplot2) # Uncomment if using ggplot2

# Use the built-in mtcars dataset
data(mtcars)

# Define the output file name
output_file <- "qq3915v9xbm6.png"

# Open a PNG device
png(output_file, width = 800, height = 600)

# Create the scatter plot
plot(mtcars$wt, mtcars$mpg,
     main = "Scatter Plot: Weight vs MPG",
     xlab = "Weight (1000 lbs)",
     ylab = "Miles per Gallon (mpg)")

# Close the PNG device to save the file
dev.off()

cat("Scatter plot saved to", output_file, "\n")