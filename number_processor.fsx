// F# Program to Process a List of Numbers

open System

// Function to calculate the average of a list of numbers
let calculateAverage numbers =
    match numbers with
    | [] -> 0.0
    | _ -> List.sum numbers |> float |> fun sum -> sum / float (List.length numbers)

// Function to find even numbers in a list
let findEvenNumbers numbers = 
    List.filter (fun x -> x % 2 = 0) numbers

// Function to square each number in a list
let squareNumbers numbers =
    List.map (fun x -> x * x) numbers

// Function to find the maximum value in a list
let findMax numbers =
    match numbers with
    | [] -> None
    | _ -> Some (List.max numbers)

// Function to find the minimum value in a list
let findMin numbers =
    match numbers with
    | [] -> None
    | _ -> Some (List.min numbers)

// Main processing function
let processNumbers numbers =
    printfn "Original list: %A" numbers
    printfn "Average: %.2f" (calculateAverage numbers)
    printfn "Even numbers: %A" (findEvenNumbers numbers)
    printfn "Squared numbers: %A" (squareNumbers numbers)
    printfn "Maximum: %A" (findMax numbers)
    printfn "Minimum: %A" (findMin numbers)
    
    // Return processed results as a tuple
    (calculateAverage numbers, findEvenNumbers numbers, squareNumbers numbers, findMax numbers, findMin numbers)

// Example usage with a sample list of numbers
let sampleNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

// Process the numbers
let results = processNumbers sampleNumbers

// Additional example with a different list
printfn "\n--- Processing another list ---"
let anotherList = [15; 23; 8; 42; 7; 91; 4; 16]
let results2 = processNumbers anotherList

// Function to generate random filename
let generateRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let random = Random()
    let randomString = 
        [|1..10|] 
        |> Array.map (fun _ -> chars.[random.Next(chars.Length)])
        |> System.String
    sprintf "%s%s" randomString extension

// Generate a random filename for output
let randomFileName = generateRandomFileName ".txt"

// Write results to a file with random name
let writeResultsToFile filename numbers =
    let avg = calculateAverage numbers
    let evens = findEvenNumbers numbers
    let squares = squareNumbers numbers
    let max = findMax numbers
    let min = findMin numbers
    
    let content = 
        sprintf """Number Processing Results
=======================
Original list: %A
Average: %.2f
Even numbers: %A
Squared numbers: %A
Maximum: %A
Minimum: %A
""" numbers avg evens squares max min
    
    System.IO.File.WriteAllText(filename, content)
    printfn "\nResults written to file: %s" filename

// Write the results to a file with random name
writeResultsToFile randomFileName sampleNumbers