# Загрузка необходимых библиотек
# Для базовой диаграммы рассеяния библиотеки не требуются

# Генерация случайных данных для примера
set.seed(42)  # Для воспроизводимости результатов
x <- rnorm(100)  # 100 случайных значений для оси X
y <- 2 * x + rnorm(100, sd = 0.5)  # Зависимая переменная Y с небольшим шумом

# Создание имени файла
# Используем paste0 и sample для генерации случайной строки
random_string <- paste0(sample(c(letters, LETTERS, 0:9), 10, replace = TRUE), collapse = "")
plot_filename <- paste0("/workspace/scatter_plot_", random_string, ".png")

# Сохранение диаграммы рассеяния в файл PNG
png(filename = plot_filename, width = 800, height = 600)
plot(x, y, main = "Scatter Plot of Random Data", xlab = "X-axis", ylab = "Y-axis", pch = 19, col = "blue")
dev.off()

cat("Scatter plot saved to:", plot_filename, "\n")