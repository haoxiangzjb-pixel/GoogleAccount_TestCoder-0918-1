import strutils

proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write(intToStr(i * j).align(4))
    echo ""

printMultiplicationTable()