import strutils

proc printMultiplicationTable(size: int) =
  ## Выводит таблицу умножения размером size x size
  # Выводим заголовок
  stdout.write "   |"
  for j in 1..size:
    stdout.write align($j, 4)
  stdout.write "\n"
  stdout.write "---|"
  for j in 1..size:
    stdout.write "----"
  stdout.write "\n"

  # Выводим строки таблицы
  for i in 1..size:
    stdout.write align($i, 3)
    stdout.write "|"
    for j in 1..size:
      stdout.write align($(i * j), 4)
    stdout.write "\n"

# Вызов процедуры для таблицы 10x10
printMultiplicationTable(10)