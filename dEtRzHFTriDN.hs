-- Haskell递归函数计算列表长度
listLength :: [a] -> Int
listLength [] = 0                    -- 空列表长度为0
listLength (x:xs) = 1 + listLength xs  -- 非空列表长度为1加上剩余列表长度

-- 示例用法
main :: IO ()
main = do
    putStrLn $ "列表 [1,2,3,4,5] 的长度是: " ++ show (listLength [1,2,3,4,5])
    putStrLn $ "空列表 [] 的长度是: " ++ show (listLength [])
    putStrLn $ "字符串 \"Hello\" 的长度是: " ++ show (listLength "Hello")