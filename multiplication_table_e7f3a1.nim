proc printMultiplicationTable() =
  ## Выводит таблицу умножения размером 10x10.
  for i in 1..10:
    for j in 1..10:
      stdout.write align((i * j).int, 4)
    echo ""

printMultiplicationTable()