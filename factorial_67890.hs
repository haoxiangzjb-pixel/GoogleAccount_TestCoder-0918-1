-- Function to compute the factorial of a number
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)

-- Example usage
main :: IO ()
main = do
  putStrLn $ "Factorial of 5 is: " ++ show (factorial 5)
  putStrLn $ "Factorial of 0 is: " ++ show (factorial 0)