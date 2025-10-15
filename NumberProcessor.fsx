open System
open System.IO

// Function to process a list of numbers
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x)  // Square each number as an example processing
    |> List.filter (fun x -> x > 10)  // Keep only numbers greater than 10
    |> List.sort  // Sort the results

// Generate a random filename
let getRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let random = Random()
    let fileName = 
        [1..10] 
        |> List.map (fun _ -> chars.[random.Next(chars.Length)])
        |> List.toArray
        |> System.String
    sprintf "%s%s" fileName extension

// Main execution
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
let processedNumbers = processNumbers numbers

// Generate random filename with .txt extension
let fileName = getRandomFileName ".txt"

// Write processed numbers to the file
File.WriteAllText(fileName, (processedNumbers |> List.map string |> String.concat "\n"))

printfn "Original numbers: %A" numbers
printfn "Processed numbers: %A" processedNumbers
printfn "Results saved to: %s" fileName