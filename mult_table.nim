import random, os

proc printMultiplicationTable(size: int) =
  for i in 1..size:
    for j in 1..size:
      stdout.write($ (i * j) & "\t")
    stdout.write("\n")

proc generateRandomFilename(): string =
  randomize()
  result = "mult_table_" & $rand(1000..9999) & ".txt"

let filename = generateRandomFilename()
echo "Saving multiplication table to: ", filename

# Redirect stdout to file
let file = open(filename, fmWrite)
file.write("Multiplication Table (10x10):\n")
for i in 1..10:
  for j in 1..10:
    file.write($ (i * j) & "\t")
  file.write("\n")
file.close()

echo "File saved successfully!"