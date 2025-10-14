proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения размером n x n
  # Печатаем заголовок
  stdout.write("    ")
  for j in 1..n:
    stdout.write(j, "\t")
  stdout.write("\n")

  # Печатаем разделитель
  stdout.write("    ")
  for j in 1..n:
    stdout.write("---", "\t")
  stdout.write("\n")

  # Печатаем строки таблицы
  for i in 1..n:
    stdout.write(i, " | ")
    for j in 1..n:
      stdout.write(i * j, "\t")
    stdout.write("\n")

printMultiplicationTable(10)