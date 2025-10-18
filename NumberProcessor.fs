module NumberProcessor

open System
open System.IO

// Function to process a list of numbers
let processNumbers numbers =
    // Example processing: square each number and filter out even results
    numbers
    |> List.map (fun x -> x * x)  // Square each number
    |> List.filter (fun x -> x % 2 <> 0)  // Keep only odd results
    |> List.sort  // Sort the results

// Generate a random filename
let generateRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let random = Random()
    let randomString = 
        [1..10] 
        |> List.map (fun _ -> chars.[random.Next(chars.Length)])
        |> List.toArray
        |> System.String
    sprintf "%s%s" randomString extension

// Main function
let main() =
    // Sample list of numbers to process
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; -3; -5; -7]
    
    printfn "Original numbers: %A" numbers
    
    // Process the numbers
    let processedNumbers = processNumbers numbers
    
    printfn "Processed numbers (squared, filtered odd only, sorted): %A" processedNumbers
    
    // Generate a random filename
    let fileName = generateRandomFileName ".txt"
    
    // Write the results to the file
    let content = sprintf "Original numbers: %A\nProcessed numbers: %A" numbers processedNumbers
    File.WriteAllText(fileName, content)
    
    printfn "Results saved to file: %s" fileName

// Execute the main function
main()