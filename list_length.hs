-- Haskell recursive function to calculate list length
listLength :: [a] -> Int
listLength [] = 0
listLength (x:xs) = 1 + listLength xs

-- Example usage
main :: IO ()
main = do
    print $ listLength [1, 2, 3, 4, 5]  -- Output: 5
    print $ listLength []                -- Output: 0
    print $ listLength ['a', 'b', 'c']   -- Output: 3