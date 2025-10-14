open System

// Пример простой обработки списка чисел: вычисление квадратов
let processNumbers numbers =
    numbers |> List.map (fun x -> x * x)

[<EntryPoint>]
let main argv =
    let inputNumbers = [1; 2; 3; 4; 5]
    let processedNumbers = processNumbers inputNumbers
    printfn "Original numbers: %A" inputNumbers
    printfn "Processed numbers (squares): %A" processedNumbers
    0