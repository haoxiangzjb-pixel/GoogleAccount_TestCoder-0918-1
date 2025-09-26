proc printMultiplicationTable(n: int) =
  ## Выводит таблицу умножения n x n
  # Печатаем заголовок
  stdout.write("    ")
  for j in 1..n:
    stdout.write(j, " ")
  stdout.write("\n")

  # Печатаем разделитель
  stdout.write("   ")
  for j in 1..n:
    stdout.write("--")
  stdout.write("\n")

  # Печатаем строки таблицы
  for i in 1..n:
    stdout.write(i, " | ")
    for j in 1..n:
      stdout.write(i * j, " ")
    stdout.write("\n")

# Пример использования
printMultiplicationTable(10)