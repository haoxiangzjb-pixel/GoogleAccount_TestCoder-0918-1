{-# LANGUAGE OverloadedStrings #-}

import System.Random
import Data.Time
import Data.Time.Format
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import System.IO
import Control.Monad

-- Generate a random string of specified length
generateRandomString :: Int -> IO String
generateRandomString len = do
    gen <- newStdGen
    let randomChars = take len $ randomRs ('a','z') gen
    return randomChars

-- Create a random filename with timestamp
createRandomFileName :: IO String
createRandomFileName = do
    -- Get current time for uniqueness
    currentTime <- getCurrentTime
    let timeStr = formatTime defaultTimeLocale "%Y%m%d_%H%M%S" currentTime
    
    -- Generate random string
    randomStr <- generateRandomString 8
    
    -- Combine to create filename
    return $ "user_input_" ++ timeStr ++ "_" ++ randomStr ++ ".txt"

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