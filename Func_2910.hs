-- | Функция для объединения двух списков.
mergeLists :: [a] -> [a] -> [a]
mergeLists = (++)

-- Пример использования:
-- mergeLists [1, 2, 3] [4, 5, 6] -> [1, 2, 3, 4, 5, 6]
-- mergeLists "Hello" "World" -> "HelloWorld"