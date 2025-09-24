#!/usr/bin/env Rscript

# Загрузка библиотеки для генерации случайных чисел, если потребуется
# В данном случае используем встроенные функции

# Генерация случайных данных
set.seed(42)  # Для воспроизводимости
n <- 100
x <- rnorm(n)
y <- 2 * x + rnorm(n, sd = 0.5)  # y линейно зависит от x с шумом

# Создание случайного имени файла
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Сохранение диаграммы рассеяния в файл
png(random_name, width = 800, height = 600)
plot(x, y, main = "Scatter Plot", xlab = "X", ylab = "Y", pch = 16, col = "blue")
abline(lm(y ~ x), col = "red")  # Добавление линии регрессии
dev.off()

cat("Scatter plot saved to:", random_name, "\n")