// F# program to process a list of numbers
open System

// Function to process a list of numbers
let processNumbers numbers =
    let sum = List.sum numbers
    let average = List.average numbers
    let max = List.max numbers
    let min = List.min numbers
    let squared = List.map (fun x -> x * x) numbers
    let positiveCount = List.filter (fun x -> x > 0) numbers |> List.length
    
    (sum, average, max, min, squared, positiveCount)

// Example list of numbers
let numbers = [1; 2; 3; 4; 5; -2; 8; -1; 0; 10]

// Process the numbers
let (sum, average, max, min, squared, positiveCount) = processNumbers numbers

// Print results
printfn "Original list: %A" numbers
printfn "Sum: %d" sum
printfn "Average: %.2f" average
printfn "Max: %d" max
printfn "Min: %d" min
printfn "Squared values: %A" squared
printfn "Count of positive numbers: %d" positiveCount

// Additional processing: filter out negative numbers
let positiveNumbers = List.filter (fun x -> x >= 0) numbers
printfn "Positive numbers only: %A" positiveNumbers