# Процедура для вывода таблицы умножения
proc printMultiplicationTable(size: int) =
  # Выводим заголовок
  stdout.write "   |"
  for j in 1..size:
    stdout.write align($j, 4)
  stdout.write "\n"
  
  # Выводим разделитель
  stdout.write "---|"
  for j in 1..size:
    stdout.write "----"
  stdout.write "\n"

  # Выводим строки таблицы
  for i in 1..size:
    stdout.write align($i, 3) & "|"
    for j in 1..size:
      stdout.write align($(i * j), 4)
    stdout.write "\n"

# Пример использования: вывод таблицы 10x10
printMultiplicationTable(10)