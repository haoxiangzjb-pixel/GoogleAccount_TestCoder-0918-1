def factorial(n)
  if n < 0
    raise ArgumentError, "Факториал не определен для отрицательных чисел"
  end
  (1..n).reduce(1, :*)
end

# Пример использования
# puts factorial(5) # => 120