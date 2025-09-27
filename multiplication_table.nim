# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  for i in 1..9:
    for j in 1..9:
      let result = i * j
      # Форматирование вывода для аккуратного отображения
      stdout.write($result)
      # Добавляем пробелы для выравнивания
      if result < 10:
        stdout.write("  ")
      else:
        stdout.write(" ")
    # Переход на новую строку после каждой строки таблицы
    stdout.write("\n")

# Вызов процедуры
printMultiplicationTable()