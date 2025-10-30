open System
open System.IO

// Função para gerar um nome de arquivo aleatório
let generateRandomFileName extension =
    let random = Random()
    let timestamp = DateTime.Now.ToString("yyyyMMddHHmmss")
    let randomNum = random.Next(10000, 99999)
    sprintf "processed_data_%s_%d%s" timestamp randomNum extension

// Função para processar dados usando pipeline
let processData data =
    data
    |> List.map (fun x -> x * 2)  // Dobra cada elemento
    |> List.filter (fun x -> x > 10)  // Filtra valores maiores que 10
    |> List.sort  // Ordena os valores
    |> List.distinct  // Remove duplicatas

// Função para salvar dados em arquivo com nome aleatório
let saveDataToFile data =
    let fileName = generateRandomFileName ".txt"
    let filePath = Path.Combine(Environment.CurrentDirectory, fileName)
    
    let content = 
        data 
        |> processData 
        |> List.map string 
        |> String.concat "\n"
    
    File.WriteAllText(filePath, content)
    printfn "Dados salvos no arquivo: %s" fileName
    filePath

// Exemplo de uso
let sampleData = [1; 5; 3; 8; 12; 7; 15; 2; 20; 10; 18; 8; 25]
let savedFilePath = saveDataToFile sampleData

printfn "Processamento concluído. Arquivo salvo em: %s" savedFilePath