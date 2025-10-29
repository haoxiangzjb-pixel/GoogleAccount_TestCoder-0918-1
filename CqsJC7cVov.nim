proc printMultiplicationTable() =
  for i in 1..10:
    for j in 1..10:
      stdout.write align((i * j), 4)
    echo ""
printMultiplicationTable()
