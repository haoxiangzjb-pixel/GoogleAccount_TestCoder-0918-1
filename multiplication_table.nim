import std/strformat

proc printMultiplicationTable() =
  for i in 1..9:
    for j in 1..9:
      stdout.write(&"{i*j:4}")
    echo ""

printMultiplicationTable()