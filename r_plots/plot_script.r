# 生成随机数据
set.seed(123) # 设置随机种子以确保结果可复现
categories <- c("A", "B", "C", "D", "E")
values <- sample(10:100, 5)

# 创建柱状图
barplot(values, names.arg = categories, col = rainbow(5), main = "Sample Bar Chart", xlab = "Categories", ylab = "Values")

# 保存图表到文件 (R会自动添加.png扩展名)
dev.copy(png, filename = "bar_chart.png")
dev.off() # 关闭图形设备