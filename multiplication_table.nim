proc printMultiplicationTable() =
  ## Процедура для вывода таблицы умножения 10x10
  echo "Таблица умножения:"
  echo ""
  
  # Выводим заголовок с номерами столбцов
  stdout.write("   |")
  for j in 1..10:
    stdout.write($j, "   ")
  echo ""
  
  # Выводим разделительную линию
  stdout.write("---+")
  for j in 1..10:
    stdout.write("----")
  echo ""
  
  # Выводим строки таблицы
  for i in 1..10:
    stdout.write($i, "  |")
    for j in 1..10:
      let result = $(i * j)
      stdout.write(result, "   ")
    echo ""

# Вызов процедуры
printMultiplicationTable()