-- Function to merge two lists in Haskell
-- This function simply concatenates two lists of the same type
mergeLists :: [a] -> [a] -> [a]
mergeLists xs ys = xs ++ ys

-- Example usage:
-- mergeLists [1, 2, 3] [4, 5, 6] returns [1, 2, 3, 4, 5, 6]
-- mergeLists "hello" "world" returns "helloworld"
-- mergeLists [1, 3, 5] [2, 4, 6] returns [1, 3, 5, 2, 4, 6]

-- Alternative implementation using recursion
mergeListsRecursive :: [a] -> [a] -> [a]
mergeListsRecursive [] ys = ys
mergeListsRecursive (x:xs) ys = x : mergeListsRecursive xs ys

-- If you want to merge two sorted lists maintaining sorted order:
mergeSorted :: Ord a => [a] -> [a] -> [a]
mergeSorted [] ys = ys
mergeSorted xs [] = xs
mergeSorted (x:xs) (y:ys)
  | x <= y    = x : mergeSorted xs (y:ys)
  | otherwise = y : mergeSorted (x:xs) ys