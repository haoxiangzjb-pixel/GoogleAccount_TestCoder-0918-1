// Функция для обработки списка чисел: вычисление суммы и фильтрация четных чисел
let processNumbers numbers =
    let sum = List.sum numbers
    let evenNumbers = List.filter (fun x -> x % 2 = 0) numbers
    (sum, evenNumbers)

[<EntryPoint>]
let main argv =
    let inputNumbers = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10]
    let total, evens = processNumbers inputNumbers

    printfn "Входной список: %A" inputNumbers
    printfn "Сумма всех чисел: %d" total
    printfn "Четные числа: %A" evens

    // Сохранение результата в файл со случайным именем
    let fileName = System.IO.Path.GetRandomFileName() + ".txt"
    let content = sprintf "Входной список: %A\nСумма: %d\nЧетные числа: %A" inputNumbers total evens
    System.IO.File.WriteAllText(fileName, content)
    printfn "Результаты сохранены в файл: %s" fileName

    0 // Возврат кода завершения