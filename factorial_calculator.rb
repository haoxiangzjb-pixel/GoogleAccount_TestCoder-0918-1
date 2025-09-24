# frozen_string_literal: true

# Модуль для вычисления факториала
module FactorialCalculator
  # Метод для вычисления факториала числа
  # @param n [Integer] неотрицательное целое число
  # @return [Integer] факториал числа n
  def self.factorial(n)
    raise ArgumentError, "Число должно быть неотрицательным" if n < 0

    return 1 if n <= 1
    n * factorial(n - 1)
  end
end

# Пример использования
puts FactorialCalculator.factorial(5) # Выведет 120