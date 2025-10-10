-- 定义一个递归函数来计算列表的长度
myLength :: [a] -> Int
myLength [] = 0          -- 基本情况：空列表的长度为0
myLength (x:xs) = 1 + myLength xs  -- 递归情况：列表长度等于1加上剩余列表的长度

-- 示例用法
main :: IO ()
main = do
    print $ myLength [1, 2, 3, 4, 5]  -- 输出 5
    print $ myLength "hello"          -- 输出 5
    print $ myLength ([] :: [Int])    -- 输出 0