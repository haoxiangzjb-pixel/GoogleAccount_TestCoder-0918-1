# Загружаем необходимые библиотеки (хотя base R обычно хватает для простых задач)
# library(ggplot2) # Можно раскомментировать, если планируется использовать ggplot2

# Генерируем случайные данные
n_points <- 100
x_data <- rnorm(n_points)
y_data <- rnorm(n_points)

# Создаем имя файла изображения
# Используем временную метку и случайное число для уникальности
file_name <- paste0("scatter_plot_", format(Sys.time(), "%Y%m%d_%H%M%S"), "_", sample(1000:9999, 1), ".png")

# Открываем устройство PNG для записи
png(file_name, width = 800, height = 600)

# Создаем диаграмму рассеяния
plot(x_data, y_data, main="Scatter Plot", xlab="X axis", ylab="Y axis")

# Закрываем устройство PNG (сохраняем файл)
dev.off()

# Печатаем имя созданного файла
cat("Scatter plot saved as:", file_name, "\n")