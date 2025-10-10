open System

// Функция для обработки списка чисел: вычисление квадратов и фильтрация четных
let processNumbers numbers =
    numbers
    |> List.map (fun x -> x * x) // Возведение в квадрат
    |> List.filter (fun x -> x % 2 = 0) // Фильтрация четных чисел

[<EntryPoint>]
let main argv =
    let inputNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let processedNumbers = processNumbers inputNumbers
    let outputString = processedNumbers |> List.map string |> String.concat ", "
    let fileName = sprintf "output_%d.txt" (DateTime.Now.Ticks % 1000000L) // Генерация случайного имени файла
    System.IO.File.WriteAllText(fileName, outputString)
    printfn "Список обработан. Результаты сохранены в файл %s" fileName
    0