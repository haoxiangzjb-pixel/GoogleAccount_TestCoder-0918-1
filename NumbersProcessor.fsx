// Функция для обработки списка чисел
let processNumbers numbers =
    numbers
    |> List.filter (fun x -> x > 0)  // Оставить только положительные
    |> List.map (fun x -> x * x)     // Возвести в квадрат
    |> List.sortDescending         // Отсортировать по убыванию

// Пример входных данных
let inputNumbers = [ -2; 5; -1; 3; 0; 8; -5; 10 ]

// Обработка
let result = processNumbers inputNumbers

// Вывод результата
printfn "Исходный список: %A" inputNumbers
printfn "Обработанный список: %A" result

// Сохранение результата в файл со случайным именем
open System
open System.IO

let randomFileName = Path.GetRandomFileName() + ".txt"
File.WriteAllText(randomFileName, sprintf "Обработанный список: %A" result)

printfn $"Результаты сохранены в файл: {randomFileName}"
