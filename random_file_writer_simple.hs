import System.Random
import System.IO
import Data.Char
import Control.Monad

-- Generate a random string of specified length
generateRandomString :: Int -> IO String
generateRandomString len = do
    gen <- newStdGen
    let randomChars = take len $ randomRs ('a','z') gen
    return randomChars

-- Create a random filename
createRandomFileName :: IO String
createRandomFileName = do
    -- Generate random string
    randomStr <- generateRandomString 10
    
    -- Combine to create filename
    return $ "user_input_" ++ randomStr ++ ".txt"

-- Main function
main :: IO ()
main = do
    putStrLn "Enter your text (press Ctrl+D or Ctrl+Z to finish):"
    
    -- Read multi-line input until EOF
    userInput <- getContents
    
    -- Generate random filename
    fileName <- createRandomFileName
    
    -- Write to the file
    writeFile fileName userInput
    
    putStrLn $ "Content saved to file: " ++ fileName