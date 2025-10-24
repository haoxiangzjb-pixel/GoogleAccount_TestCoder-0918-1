open System
open System.IO

// Function to process a list of numbers
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x) // Square each number as an example processing

// Sample list of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let processedNumbers = processNumbers numbers

// Generate a random filename
let random = Random()
let randomFileName = sprintf "output_%d.txt" (random.Next(10000, 99999))

// Convert the processed numbers to a string for saving
let content = 
    processedNumbers
    |> List.map string
    |> String.concat ", "

// Write the processed numbers to the file
File.WriteAllText(randomFileName, content)

printfn "Processed numbers: %A" processedNumbers
printfn "Saved to file: %s" randomFileName