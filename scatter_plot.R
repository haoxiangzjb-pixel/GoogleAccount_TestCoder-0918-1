# Генерация случайных данных
set.seed(42)  # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание диаграммы рассеяния
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y", pch = 19)

# Сохранение графика в файл со случайным именем
filename <- paste0("scatter_plot_", sample(10000:99999, 1), ".png")
png(filename)
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y", pch = 19)
dev.off()

cat("График сохранен в файл:", filename, "\n")