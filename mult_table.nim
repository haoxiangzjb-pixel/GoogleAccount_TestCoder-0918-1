import random, times, strformat

proc printMultiplicationTable(maxNumber: int, filename: string) =
  var f: File
  if open(f, filename, fmWrite):
    for i in 1..maxNumber:
      for j in 1..maxNumber:
        f.write(fmt"{i}x{j}={i*j}")
        f.write(chr(9)) # Tab character
      f.write("\n")
    f.close()
    echo "Multiplication table saved to: ", filename
  else:
    echo "Failed to create file: ", filename

# Generate a random filename
randomize()
let filename = "mult_table_" & $int(getTime().toUnix() mod 1000000) & ".txt"

# Call the procedure to create the multiplication table
printMultiplicationTable(10, filename)