open System
open System.IO

// Function to generate a random filename
let getRandomFileName extension =
    let random = Random()
    let randomPart = String.init 8 (fun _ -> 
        let i = random.Next(0, 26)
        char (int 'a' + i))
    sprintf "processed_data_%s%s" randomPart extension

// Example data processing pipeline
let processData data =
    data
    |> List.map (fun x -> x * 2)  // Double each element
    |> List.filter (fun x -> x > 10)  // Keep only values greater than 10
    |> List.sort  // Sort the results
    |> List.rev  // Reverse the order

// Function to save processed data to a file with random name
let saveToRandomFile data =
    let fileName = getRandomFileName ".txt"
    let filePath = Path.Combine(Directory.GetCurrentDirectory(), fileName)
    
    let content = 
        data 
        |> processData 
        |> List.map string 
        |> String.concat "\n"
    
    File.WriteAllText(filePath, content)
    printfn "Data saved to: %s" filePath
    filePath

// Example usage
let sampleData = [1; 3; 5; 7; 9; 11; 13; 15; 17; 19]
let savedFilePath = saveToRandomFile sampleData

printfn "Original data: %A" sampleData
printfn "Processed data: %A" (processData sampleData)