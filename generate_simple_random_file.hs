-- Recursive function to calculate the length of a list
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

-- A simple function that creates a file with a "random" name by using a fixed pattern
-- Since we don't have access to random generation in basic Haskell install
createRandomNamedFile :: IO ()
createRandomNamedFile = do
    let filename = "listFunc_" ++ show (789456123 :: Int) ++ ".hs"  -- Using a fixed number to simulate randomness
    putStrLn $ "Generating file with name: " ++ filename
    
    let haskellCodeContent = unlines
            [ "-- Recursive function to calculate the length of a list"
            , "listLength :: [a] -> Int"
            , "listLength [] = 0"
            , "listLength (x:xs) = 1 + listLength xs"
            , ""
            , "-- Example usage"
            , "main :: IO ()"
            , "main = do"
            , "    let exampleList = [1, 2, 3, 4, 5]"
            , "    putStrLn $ \"Length of \" ++ show exampleList ++ \" is: \" ++ show (listLength exampleList)"
            , "    "
            , "    let emptyList = [] :: [Int]  -- Specify the type to resolve ambiguity"
            , "    putStrLn $ \"Length of \" ++ show emptyList ++ \" is: \" ++ show (listLength emptyList)"
            , "    "
            , "    let stringList = [\"hello\", \"world\", \"haskell\"]"
            , "    putStrLn $ \"Length of \" ++ show stringList ++ \" is: \" ++ show (listLength stringList)"
            ]
    
    writeFile filename haskellCodeContent
    putStrLn $ "Successfully wrote the recursive list length function to " ++ filename

main :: IO ()
main = do
    createRandomNamedFile