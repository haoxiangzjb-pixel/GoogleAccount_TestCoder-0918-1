# Генерация случайных данных
set.seed(42) # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание диаграммы рассеяния
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y")

# Генерация случайного имени файла
random_name <- paste0("scatter_plot_", sample(1000:9999, 1), ".png")

# Сохранение диаграммы в файл
png(random_name)
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y")
dev.off()

cat("Диаграмма рассеяния сохранена в файл:", random_name, "\n")