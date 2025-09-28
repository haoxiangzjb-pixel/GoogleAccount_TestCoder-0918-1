# Генерация случайных данных
set.seed(42)  # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание случайного имени файла
random_name <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")

# Открытие PNG устройства с случайным именем
png(random_name, width = 800, height = 600)

# Построение диаграммы рассеяния
plot(x, y, main = "Scatter Plot", xlab = "X", ylab = "Y", pch = 19, col = "blue")

# Закрытие PNG устройства
dev.off()

# Вывод имени созданного файла
cat("Plot saved to:", random_name, "\n")