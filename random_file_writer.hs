import System.Random
import System.IO
import Data.Char (chr)

-- Function to generate a random string of given length
generateRandomString :: Int -> IO String
generateRandomString len = do
    gen <- newStdGen
    let randomValues = randomRs (0, 61) gen
    let randomChars = map randomChar randomValues
    return $ take len randomChars
  where
    randomChar n
        | n < 26 = chr (97 + n)           -- 'a' to 'z'
        | n < 52 = chr (65 + n - 26)      -- 'A' to 'Z'
        | otherwise = chr (48 + n - 52)   -- '0' to '9'

-- Function to generate a random filename with extension
generateRandomFilename :: IO String
generateRandomFilename = do
    randomStr <- generateRandomString 10
    return $ randomStr ++ ".txt"

-- Main function
main :: IO ()
main = do
    putStrLn "Digite seu texto (pressione Ctrl+D ou Ctrl+Z para finalizar):"
    
    -- Read all input from user
    userInput <- getContents
    
    -- Generate random filename
    filename <- generateRandomFilename
    
    -- Write to file
    writeFile filename userInput
    
    putStrLn $ "Texto salvo no arquivo: " ++ filename