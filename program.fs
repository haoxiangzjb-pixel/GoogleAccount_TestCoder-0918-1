open System
open System.IO

// Функция для обработки списка чисел: находит сумму, минимальное и максимальное значение
let processNumbers numbers =
    match numbers with
    | [] -> (0, 0, 0) // Если список пустой, возвращаем нули
    | _ ->
        let sum = List.sum numbers
        let min = List.min numbers
        let max = List.max numbers
        (sum, min, max)

// Основная часть программы
let numbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]

let sum, min, max = processNumbers numbers

let output = sprintf "Список: %A\nСумма: %d\nМинимум: %d\nМаксимум: %d\n" numbers sum min max

// Генерация случайного имени файла
let random = Random()
let fileName = sprintf "/workspace/output_%d.txt" random.Next

// Сохранение результата в файл
File.WriteAllText(fileName, output)

printfn "Результаты обработки сохранены в файл: %s" fileName
printfn "%s" output