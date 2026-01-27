import std/strutils

proc printMultiplicationTable(n: int) =
  echo "Таблица умножения до ", n, ":"
  echo "============================="
  
  for i in 1..n:
    for j in 1..n:
      let result = i * j
      stdout.write align($result, 4)
      if j < n:
        stdout.write " | "
    echo ""
    if i < n:
      echo "-----------------------------"

when isMainModule:
  printMultiplicationTable(9)
