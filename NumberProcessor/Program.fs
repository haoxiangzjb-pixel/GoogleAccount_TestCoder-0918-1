// F# program to process a list of numbers
open System
open System.IO

// Function to process a list of numbers
let processNumbers numbers =
    let sum = List.sum numbers
    let avg = List.average (List.map float numbers)
    let max = List.max numbers
    let min = List.min numbers
    let evens = List.filter (fun x -> x % 2 = 0) numbers
    let odds = List.filter (fun x -> x % 2 <> 0) numbers
    
    (sum, avg, max, min, evens, odds)

// Function to generate a random filename
let generateRandomFileName extension =
    let chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    let random = Random()
    let fileName = 
        [1..10] 
        |> List.map (fun _ -> chars.[random.Next(chars.Length)])
        |> List.toArray
        |> System.String
    fileName + extension

// Main program
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 15; 20; 25; 30]

printfn "Original list: %A" numbers

// Process the numbers
let (sum, avg, max, min, evens, odds) = processNumbers numbers

printfn "Sum: %d" sum
printfn "Average: %.2f" avg
printfn "Max: %d" max
printfn "Min: %d" min
printfn "Even numbers: %A" evens
printfn "Odd numbers: %A" odds

// Generate a random filename
let randomFileName = generateRandomFileName ".txt"
let filePath = Path.Combine(Directory.GetCurrentDirectory(), randomFileName)

// Write results to the file
let content = 
    sprintf "Number Processing Results\n=========================\nOriginal list: %A\nSum: %d\nAverage: %.2f\nMax: %d\nMin: %d\nEven numbers: %A\nOdd numbers: %A\n" 
            numbers sum avg max min evens odds

File.WriteAllText(filePath, content)

printfn "\nResults saved to: %s" filePath
