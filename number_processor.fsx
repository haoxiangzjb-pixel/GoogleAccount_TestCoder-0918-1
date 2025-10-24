open System
open System.IO

// Function to process a list of numbers (example: square each number and filter even numbers)
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x)  // Square each number
    |> List.filter (fun x -> x % 2 = 0)  // Keep only even squares

// Generate a random filename
let generateRandomFileName extension =
    let chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let random = Random()
    let randomString = 
        [|1..10|] 
        |> Array.map (fun _ -> chars.[random.Next(chars.Length)])
        |> System.String
    sprintf "%s%s" randomString extension

// Main function
let main() =
    // Sample list of numbers to process
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    
    printfn "Original numbers: %A" numbers
    
    // Process the numbers
    let processedNumbers = processNumbers numbers
    
    printfn "Processed numbers (squared and filtered for even): %A" processedNumbers
    
    // Generate a random filename
    let fileName = generateRandomFileName ".txt"
    
    // Save the processed numbers to the file
    let content = sprintf "Original numbers: %A\nProcessed numbers: %A" numbers processedNumbers
    File.WriteAllText(fileName, content)
    
    printfn "Results saved to file: %s" fileName

// Run the program
main()