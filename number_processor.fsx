// F# program to process a list of numbers
open System

// Function to calculate average of a list
let average list =
    if List.isEmpty list then 0.0
    else
        list |> List.sum |> float |> fun sum -> sum / float (List.length list)

// Function to filter even numbers
let filterEven nums = 
    nums |> List.filter (fun x -> x % 2 = 0)

// Function to square each number
let squareNumbers nums = 
    nums |> List.map (fun x -> x * x)

// Function to find the maximum value
let findMax nums = 
    match nums with
    | [] -> None
    | _ -> Some (List.max nums)

// Function to find the minimum value
let findMin nums = 
    match nums with
    | [] -> None
    | _ -> Some (List.min nums)

// Main processing function
let processNumbers numbers =
    printfn "Original list: %A" numbers
    printfn "Filtered even numbers: %A" (filterEven numbers)
    printfn "Squared numbers: %A" (squareNumbers numbers)
    printfn "Average: %f" (average numbers)
    printfn "Maximum: %A" (findMax numbers)
    printfn "Minimum: %A" (findMin numbers)
    
    // Just return the original list since we don't need to return a complex type
    numbers

// Define a sample list of numbers to process
let sampleNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; 15; 20; 25]

// Process the numbers
processNumbers sampleNumbers

// Print a summary
printfn "\nProcessing complete!"
printfn "Processed %d numbers" (List.length sampleNumbers)