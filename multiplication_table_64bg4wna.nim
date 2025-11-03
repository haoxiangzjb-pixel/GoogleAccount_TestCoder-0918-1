# Процедура для вывода таблицы умножения до 10x10
proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      let result = i * j
      stdout.write align($result, 4)
    echo()

# Вызов процедуры
printMultiplicationTable()