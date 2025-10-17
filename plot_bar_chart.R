# 创建柱状图并保存
# 生成示例数据
data <- data.frame(
  category = c("A", "B", "C", "D", "E"),
  values = c(23, 45, 56, 78, 32)
)

# 绘制柱状图
barplot(data$values, 
        names.arg = data$category,
        main = "示例柱状图",
        xlab = "类别",
        ylab = "数值",
        col = "lightblue",
        border = "black")

# 也可以使用ggplot2创建更美观的柱状图
if (!require(ggplot2)) {
  install.packages("ggplot2")
  library(ggplot2)
}

# 使用ggplot2绘制柱状图
p <- ggplot(data, aes(x = category, y = values)) +
  geom_bar(stat = "identity", fill = "steelblue", color = "black") +
  labs(title = "使用ggplot2的柱状图",
       x = "类别",
       y = "数值") +
  theme_minimal()

# 显示图形
print(p)

# 保存图形到文件
ggsave("bar_chart.png", plot = p, width = 8, height = 6)