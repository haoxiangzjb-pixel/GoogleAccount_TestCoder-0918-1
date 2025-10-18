import random
import string
import os

def generate_random_filename(extension):
    """Generate a random filename with the given extension."""
    random_string = ''.join(random.choices(string.ascii_lowercase + string.digits, k=10))
    return f"{random_string}.{extension}"

def save_fsharp_code_to_random_file():
    # F# code to process a list of numbers
    fsharp_code = '''// F# program to process a list of numbers
open System

// Define a list of numbers to process
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; -5; -3; 15; 20; 25]

printfn "Original list: %A" numbers

// Filter positive numbers
let positiveNumbers = List.filter (fun x -> x > 0) numbers
printfn "Positive numbers: %A" positiveNumbers

// Square each number
let squaredNumbers = List.map (fun x -> x * x) numbers
printfn "Squared numbers: %A" squaredNumbers

// Calculate sum of all numbers
let sum = List.sum numbers
printfn "Sum of all numbers: %d" sum

// Calculate average of positive numbers
let avg = 
    if List.length positiveNumbers > 0 then
        float (List.sum positiveNumbers) / float (List.length positiveNumbers)
    else
        0.0
printfn "Average of positive numbers: %.2f" avg

// Find maximum and minimum values
let maxVal = List.max numbers
let minVal = List.min numbers
printfn "Maximum value: %d" maxVal
printfn "Minimum value: %d" minVal

// Count even numbers
let evenCount = List.filter (fun x -> x % 2 = 0) numbers |> List.length
printfn "Count of even numbers: %d" evenCount

// Process the list with a pipeline
let processedResult = 
    numbers
    |> List.filter (fun x -> x > 0)  // Only positive
    |> List.map (fun x -> x * 2)     // Double each
    |> List.filter (fun x -> x < 30) // Only those less than 30
printfn "Processed result (positive, doubled, less than 30): %A" processedResult

// Calculate the product of all positive numbers
let product = 
    match positiveNumbers with
    | [] -> 0
    | _ -> List.fold (*) 1 positiveNumbers
printfn "Product of positive numbers: %d" product

printfn "\\nProcessing completed!"
'''

    # Generate a random filename with .fsx extension
    random_filename = generate_random_filename("fsx")
    
    # Save the F# code to the random filename
    with open(random_filename, 'w') as file:
        file.write(fsharp_code)
    
    print(f"F# program saved to: {random_filename}")
    return random_filename

# Run the function
random_file = save_fsharp_code_to_random_file()