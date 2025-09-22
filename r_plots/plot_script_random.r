# Load necessary library
library(ggplot2)

# Create sample data
data <- data.frame(
  category = c("A", "B", "C", "D"),
  values = c(23, 45, 56, 78)
)

# Create the bar plot
p <- ggplot(data, aes(x = category, y = values)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Sample Bar Plot", x = "Category", y = "Values") +
  theme_minimal()

# Save the plot to a file
ggsave("bar_plot.png", plot = p, width = 8, height = 6, dpi = 300)

# Display the plot
print(p)