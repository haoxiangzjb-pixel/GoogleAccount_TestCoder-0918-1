-- | This module provides a function to compute the factorial of a non-negative integer.
module Factorial where

-- | Computes the factorial of a given non-negative integer.
--   The input must be non-negative, otherwise the function will not terminate.
--
--   Examples:
--   >>> factorial 0
--   1
--   >>> factorial 5
--   120
factorial :: Integer -> Integer
factorial n
  | n < 0     = error "Factorial is not defined for negative numbers"
  | n == 0    = 1
  | otherwise = n * factorial (n - 1)
