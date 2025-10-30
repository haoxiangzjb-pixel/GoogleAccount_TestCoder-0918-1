import System.Random
import Data.Time
import Data.Time.Format
import Control.Monad
import System.IO

-- Função para gerar um nome de arquivo aleatório
generateRandomFileName :: IO String
generateRandomFileName = do
    -- Gera um número aleatório
    randomNum <- randomRIO (100000, 999999) :: IO Int
    -- Obtém o timestamp atual
    currentTime <- getCurrentTime
    let timeStr = formatTime defaultTimeLocale "%Y%m%d_%H%M%S" currentTime
    -- Combina timestamp e número aleatório para formar o nome do arquivo
    return $ "user_input_" ++ timeStr ++ "_" ++ show randomNum ++ ".txt"

-- Função principal
main :: IO ()
main = do
    putStrLn "Digite seu texto (pressione Ctrl+D para finalizar):"
    
    -- Lê todas as linhas de entrada do usuário
    userInput <- getContents
    
    -- Gera um nome de arquivo aleatório
    fileName <- generateRandomFileName
    
    -- Escreve a entrada do usuário no arquivo
    writeFile fileName userInput
    
    putStrLn $ "Texto salvo no arquivo: " ++ fileName