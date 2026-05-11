# Процедура для вывода таблицы умножения в Nim

proc printMultiplicationTable*(max: int = 10) =
  ## Выводит таблицу умножения от 1 до max
  for i in 1..max:
    for j in 1..max:
      stdout.write($i & " x " & $j & " = " & $(i * j))
      if j < max:
        stdout.write(", ")
    stdout.write("\n")

when isMainModule:
  printMultiplicationTable(10)
