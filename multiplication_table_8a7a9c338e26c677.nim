# Процедура для вывода таблицы умножения на языке Nim

proc printMultiplicationTable*(n: int = 10) =
  ## Выводит таблицу умножения от 1 до n
  for i in 1..n:
    for j in 1..n:
      stdout.write(i * j)
      if j < n:
        stdout.write("\t")
    stdout.write("\n")

when isMainModule:
  # Запуск процедуры с таблицей умножения 10x10
  printMultiplicationTable()
