# Процедура для вывода таблицы умножения в Nim

proc printMultiplicationTable(size: int = 10) =
  ## Выводит таблицу умножения размером size x size
  # Печатаем заголовок
  stdout.write("    ")
  for i in 1..size:
    stdout.write(i, " ")
  stdout.write("\n")
  
  # Печатаем разделитель
  stdout.write("   ")
  for i in 1..size:
    stdout.write("---")
  stdout.write("\n")
  
  # Печатаем строки таблицы
  for i in 1..size:
    stdout.write(i, " | ")
    for j in 1..size:
      stdout.write((i * j).align(2), " ")
    stdout.write("\n")

# Пример использования
printMultiplicationTable(10)