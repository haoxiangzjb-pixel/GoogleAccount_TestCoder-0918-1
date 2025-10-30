import std/random

# Define a macro that generates repetitive code
macro generateRepetitiveCode(count: static[int]): untyped =
  result = newStmtList()
  for i in 1..count:
    let stmt = newCall("echo", newStrLitNode("Repetitive code line " & $i))
    result.add(stmt)

# Example usage
proc main() =
  echo "Generating repetitive code..."
  generateRepetitiveCode(10)
  echo "Done!"

main()