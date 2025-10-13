open System

// Пример обработки списка: вычисление суммы квадратов четных чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x % 2 = 0)  // Фильтруем четные числа
    |> List.map (fun x -> x * x)         // Возводим в квадрат
    |> List.sum                          // Суммируем

[<EntryPoint>]
let main argv =
    let sampleList = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let result = processNumbers sampleList
    printfn "Сумма квадратов четных чисел из %A равна %d" sampleList result

    // Сохраняем результат в файл со случайным именем
    let fileName = sprintf "output_%d.txt" (DateTime.Now.Ticks % 1000000L)
    let outputContent = sprintf "Входной список: %A\nРезультат: %d" sampleList result
    System.IO.File.WriteAllText(fileName, outputContent)
    printfn "Результат сохранен в файл: %s" fileName

    0 // Возвращаемое значение для точки входа