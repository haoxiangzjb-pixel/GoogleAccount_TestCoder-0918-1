-- 定义一个递归函数来计算列表的长度
listLength :: [a] -> Int
listLength [] = 0              -- 基本情况：空列表的长度为0
listLength (x:xs) = 1 + listLength xs  -- 递归情况：列表长度等于1加上剩余部分的长度

-- 主函数，用于测试
main :: IO ()
main = do
    let testList = [1, 2, 3, 4, 5]
    putStrLn $ "The length of " ++ show testList ++ " is: " ++ show (listLength testList)