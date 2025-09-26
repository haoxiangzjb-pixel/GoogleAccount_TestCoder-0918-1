# R script to create a bar plot and save it

# Define data
categories <- c("A", "B", "C", "D")
values <- c(10, 15, 8, 12)

# Create the bar plot
barplot(values, 
        names.arg = categories,
        main = "Simple Bar Plot",
        xlab = "Categories",
        ylab = "Values",
        col = "lightblue")

# Save the plot as a PNG file
# Using a random name for the R script is possible, but saving the *plot* with a random name is more common.
# Here we save the plot itself with a simple name. The script name is fixed as per file creation.
dev.copy(png, "bar_plot.png")
dev.off()

# Print a message
print("Bar plot created and saved as bar_plot.png")