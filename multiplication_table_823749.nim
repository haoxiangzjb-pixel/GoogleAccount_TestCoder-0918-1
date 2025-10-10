# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int) =
  # Вывод строки заголовков
  stdout.write("    ")
  for j in 1..size:
    stdout.write(j, "\t")
  stdout.write("\n")

  # Вывод разделителя
  stdout.write("    ")
  for j in 1..size:
    stdout.write("---", "\t")
  stdout.write("\n")

  # Вывод строк таблицы
  for i in 1..size:
    stdout.write(i, " | ")
    for j in 1..size:
      stdout.write(i * j, "\t")
    stdout.write("\n")

# Пример вызова процедуры для таблицы 10x10
printMultiplicationTable(10)