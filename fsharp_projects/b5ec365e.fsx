open System

// Пример обработки списка: вычисление суммы квадратов четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0) // Фильтруем четные числа
    |> List.map (fun x -> x * x)        // Возводим в квадрат
    |> List.sum                         // Суммируем

[<EntryPoint>]
let main argv =
    let sampleNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let result = processNumbers sampleNumbers
    printfn "Сумма квадратов четных чисел из %A равна %d" sampleNumbers result
    0