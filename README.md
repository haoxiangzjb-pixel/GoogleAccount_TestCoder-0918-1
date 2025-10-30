# Random File Writer in Haskell

This project contains a Haskell program that reads user input and saves it to a file with a randomly generated name.

## Files

- `random_file_writer.hs`: Main program with timestamp and random string in filename
- `random_file_writer_simple.hs`: Simplified version with just random string in filename

## How to Run

1. Make sure you have Haskell (GHC) installed on your system
2. Compile the program:
   ```bash
   ghc random_file_writer.hs
   ```
3. Run the compiled executable:
   ```bash
   ./random_file_writer
   ```
4. Enter your text (use Ctrl+D on Unix/Linux/Mac or Ctrl+Z on Windows to finish input)
5. The program will create a file with a random name containing your input

## Features

- Generates a unique filename using timestamp and random characters
- Accepts multi-line input from the user
- Saves the input to a text file with a random name in the current directory

The program will output the name of the file where your input was saved.