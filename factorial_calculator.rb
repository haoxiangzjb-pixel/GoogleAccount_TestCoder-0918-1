# frozen_string_literal: true

# Модуль для вычисления факториала
module FactorialCalculator
  # Вычисляет факториал числа n (n!).
  # Возвращает 1 для n <= 1.
  # Для n > 1 рекурсивно вычисляет n * (n-1)!
  #
  # @param n [Integer] Неотрицательное целое число
  # @return [Integer] Факториал числа n
  def self.factorial(n)
    return 1 if n <= 1
    n * factorial(n - 1)
  end
end

# Пример использования
puts FactorialCalculator.factorial(5) # => 120