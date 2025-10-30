import std/random

# Define a macro that generates repetitive code
macro generateRepetitiveCode(count: static[int]): untyped =
  result = newStmtList()
  for i in 1..count:
    let stmt = newCall("echo", newStrLitNode("Repetitive code line " & $i))
    result.add(stmt)

# Example usage of the macro
proc exampleUsage() =
  generateRepetitiveCode(5)

# Generate a random name for the output file
proc generateRandomNimFileName(): string =
  const chars = "abcdefghijklmnopqrstuvwxyz0123456789"
  var fileName = "generated_"
  for i in 0..10:
    fileName &= chars[rand(chars.len - 1)]
  fileName &= ".nim"
  return fileName

# Generate the random filename
let randomFileName = generateRandomNimFileName()
echo "Generated file name: ", randomFileName

# Write the macro code to the randomly named file
let fileContent = """
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
"""

# Write the content to the randomly named file
import std/os

# Always write to the randomly generated filename
writeFile(randomFileName, fileContent)
echo "Code written to ", randomFileName

exampleUsage()