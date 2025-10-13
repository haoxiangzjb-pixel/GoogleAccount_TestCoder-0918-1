#!/usr/bin/env Rscript

# Загрузка библиотеки для генерации случайных чисел (опционально, base R обычно достаточно)
# library(stats) # stats входит в базовую установку

# Генерация случайных данных
set.seed(42)  # Для воспроизводимости
n <- 100
x <- rnorm(n)
y <- rnorm(n) + x * 0.5  # Добавим немного корреляции

# Создание графика рассеяния
plot(x, y, main="Scatter Plot", xlab="X axis", ylab="Y axis")

# Генерация случайного имени файла
# Используем функцию tempfile с указанием расширения
random_filename <- tempfile(pattern = "scatter_plot_", tmpdir = tempdir(), fileext = ".png")

# Сохранение графика в файл PNG
png(filename = random_filename, width = 800, height = 600)
plot(x, y, main="Scatter Plot", xlab="X axis", ylab="Y axis")
dev.off() # Закрываем устройство вывода

# Вывод имени созданного файла
cat("Plot saved as:", random_filename, "\n")