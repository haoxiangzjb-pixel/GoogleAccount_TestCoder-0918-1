open System

// Функция для обработки списка чисел: находит сумму, максимальное и минимальное значение
let processNumbers numbers =
    match numbers with
    | [] -> None // Обработка пустого списка
    | _ ->
        let sum = List.sum numbers
        let min = List.min numbers
        let max = List.max numbers
        Some (sum, min, max)

[<EntryPoint>]
let main argv =
    // Пример списка чисел
    let numbers = [1; 5; -3; 8; 2; 9; -1; 4]

    match processNumbers numbers with
    | Some (sum, min, max) ->
        printfn "Список: %A" numbers
        printfn "Сумма: %d" sum
        printfn "Минимум: %d" min
        printfn "Максимум: %d" max

        // Сохранение результата в файл со случайным именем
        let random = Random()
        let fileName = sprintf "result_%d.txt" (random.Next(10000, 99999))
        use file = new System.IO.StreamWriter(fileName)
        file.WriteLine(sprintf "Список: %A" numbers)
        file.WriteLine(sprintf "Сумма: %d" sum)
        file.WriteLine(sprintf "Минимум: %d" min)
        file.WriteLine(sprintf "Максимум: %d" max)

        printfn "\nРезультаты сохранены в файл: %s" fileName
    | None ->
        printfn "Список пуст."

    0 // Возврат кода выхода