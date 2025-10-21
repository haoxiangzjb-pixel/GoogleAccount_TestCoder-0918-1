# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int = 10) =
  ## Выводит таблицу умножения размером size x size
  # Выводим заголовок
  stdout.write "   |"
  for i in 1..size:
    stdout.write($i)
    # Добавляем пробелы для выравнивания
    for _ in 0..(4 - ($i).len()):
      stdout.write(" ")
  echo ""
  
  # Выводим разделитель
  stdout.write "---|"
  for i in 1..size:
    stdout.write "----"
  echo ""
  
  # Выводим строки таблицы
  for i in 1..size:
    stdout.write($i)
    # Добавляем пробелы для выравнивания номера строки
    for _ in 0..(3 - ($i).len()):
      stdout.write(" ")
    stdout.write("|")
    for j in 1..size:
      let result = $(i * j)
      stdout.write(result)
      # Добавляем пробелы для выравнивания
      for _ in 0..(4 - result.len()):
        stdout.write(" ")
    echo ""

# Пример использования
printMultiplicationTable(10)