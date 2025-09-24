-- Haskell function to calculate the length of a list using recursion
myLength :: [a] -> Int
myLength [] = 0
myLength (x:xs) = 1 + myLength xs

-- Example usage
main = do
    print $ myLength [1, 2, 3, 4, 5]  -- Output: 5
    print $ myLength []               -- Output: 0
    print $ myLength ['a', 'b', 'c']  -- Output: 3