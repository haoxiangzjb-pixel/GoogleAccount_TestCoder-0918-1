# Создаем временный файл со случайным именем
temp_file <- tempfile(fileext = ".png")

# Генерируем случайные данные
set.seed(42) # Для воспроизводимости
x <- rnorm(100)
y <- rnorm(100)

# Сохраняем диаграмму рассеяния в файл
png(temp_file)
plot(x, y, main="Scatter Plot", xlab="X-axis", ylab="Y-axis")
dev.off()

# Выводим имя созданного файла
cat("Scatter plot saved to:", temp_file, "\n")