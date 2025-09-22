proc printMultiplicationTable(maxNum: int) =
  for i in 1..maxNum:
    for j in 1..maxNum:
      stdout.write($i & " * " & $j & " = " & $(i * j) & "\t")
    stdout.write("\n")

# Example usage
printMultiplicationTable(9)