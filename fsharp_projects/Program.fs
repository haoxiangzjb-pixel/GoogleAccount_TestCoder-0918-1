// Программа на F# для обработки списка чисел
open System

// Функция для вычисления квадрата числа
let square x = x * x

// Функция для фильтрации четных чисел
let isEven x = x % 2 = 0

[<EntryPoint>]
let main argv =
    // Исходный список чисел
    let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

    printfn "Исходный список: %A" numbers

    // Фильтруем четные числа
    let evenNumbers = List.filter isEven numbers
    printfn "Четные числа: %A" evenNumbers

    // Вычисляем квадраты четных чисел
    let squaredEvens = List.map square evenNumbers
    printfn "Квадраты четных чисел: %A" squaredEvens

    // Сохраняем результат в файл со случайным именем
    let fileName = sprintf "output_%d.txt" (DateTime.Now.Ticks % 1000000L)
    let filePath = sprintf "/workspace/fsharp_projects/%s" fileName
    let content = sprintf "Исходный список: %A\nЧетные числа: %A\nКвадраты четных чисел: %A" numbers evenNumbers squaredEvens
    System.IO.File.WriteAllText(filePath, content)

    printfn "Результаты сохранены в файл: %s" filePath

    0 // Код возврата