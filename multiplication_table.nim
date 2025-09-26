# Процедура для вывода таблицы умножения
proc printMultiplicationTable() =
  for i in 1..9:
    for j in 1..9:
      let result = i * j
      # Форматирование вывода для ровной таблицы
      stdout.write align($result, 4)
    echo() # Перевод строки после каждой строки таблицы

# Вызов процедуры
printMultiplicationTable()