-- 递归函数计算列表长度
-- 基本情况：空列表的长度为0
myLength :: [a] -> Int
myLength [] = 0
-- 递归情况：列表的长度等于1加上其余部分的长度
myLength (x:xs) = 1 + myLength xs

-- 测试函数
main :: IO ()
main = do
    putStrLn $ "列表 [1, 2, 3, 4, 5] 的长度是: " ++ show (myLength [1, 2, 3, 4, 5])
    putStrLn $ "列表 [] 的长度是: " ++ show (myLength [])
    putStrLn $ "列表 ['a', 'b', 'c'] 的长度是: " ++ show (myLength ['a', 'b', 'c'])