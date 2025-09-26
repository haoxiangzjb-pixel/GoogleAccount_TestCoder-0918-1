-- 函数：计算列表的长度
-- 基本情况：空列表的长度为 0
listLength :: [a] -> Int
listLength [] = 0
-- 递归情况：列表的长度等于 1 加上其余列表的长度
listLength (x:xs) = 1 + listLength xs

-- 示例用法
main :: IO ()
main = do
    let exampleList = [1, 2, 3, 4, 5]
    putStrLn $ "列表 " ++ show exampleList ++ " 的长度是: " ++ show (listLength exampleList)