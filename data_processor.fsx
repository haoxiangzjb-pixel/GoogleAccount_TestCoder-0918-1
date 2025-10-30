open System
open System.IO

// Sample data processing function using pipeline
let processNumbers data =
    data
    |> List.map (fun x -> x * 2)                    // Double each number
    |> List.filter (fun x -> x > 10)               // Keep only numbers greater than 10
    |> List.sort                                     // Sort the results
    |> List.rev                                      // Reverse the order

// Function to save data to a file with random name
let saveDataWithRandomName data =
    let randomFileName = Path.GetRandomFileName() + ".txt"
    let filePath = Path.Combine(Environment.CurrentDirectory, randomFileName)
    
    let content = 
        data 
        |> List.map string 
        |> String.concat "\n"
    
    File.WriteAllText(filePath, content)
    printfn "Data saved to: %s" filePath
    filePath

// Example usage
let sampleData = [1; 3; 5; 7; 9; 11; 13; 15]
let processedData = sampleData |> processNumbers
let fileName = saveDataWithRandomName processedData

printfn "Original data: %A" sampleData
printfn "Processed data: %A" processedData