# Генерация случайных данных
set.seed(42)  # Для воспроизводимости
x <- rnorm(100)
y <- 2 * x + rnorm(100, sd = 0.5)

# Создание диаграммы рассеяния
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y")

# Сохранение графика в файл со случайным именем
# Используем временную директорию и функцию tempfile для генерации имени
plot_filename <- tempfile(pattern = "scatter_plot_", fileext = ".png", tmpdir = "/workspace/")
png(filename = plot_filename)
plot(x, y, main = "Диаграмма рассеяния", xlab = "X", ylab = "Y")
dev.off()

cat("Диаграмма рассеяния сохранена в файл:", plot_filename, "\n")