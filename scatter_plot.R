# Генерация случайных данных
set.seed(123) # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание имени файла
filename <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Создание диаграммы рассеяния и сохранение в файл
png(filename, width = 800, height = 600)
plot(x, y, main = "Scatter Plot", xlab = "X", ylab = "Y", pch = 19, col = "blue")
abline(lm(y ~ x), col = "red") # Добавление линии регрессии
dev.off()

cat("График сохранен в файл:", filename, "\n")