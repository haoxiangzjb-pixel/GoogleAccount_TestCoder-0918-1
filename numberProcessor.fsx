// F# Program to Process a List of Numbers
// This program squares each number in a list and filters out the odd results

let processNumbers (numbers: int list) : int list =
    numbers
    |> List.map (fun x -> x * x)        // Square each number
    |> List.filter (fun x -> x % 2 = 0) // Keep only even results

// Example usage
let inputNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
let result = processNumbers inputNumbers

printfn "Input numbers: %A" inputNumbers
printfn "Squared values: %A" (inputNumbers |> List.map (fun x -> x * x))
printfn "Even squared values: %A" result