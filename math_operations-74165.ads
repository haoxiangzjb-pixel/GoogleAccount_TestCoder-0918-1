-- math_operations.ads
-- Пакет Ada, предоставляющий базовые математические операции.

package Math_Operations is

   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (с проверкой деления на ноль)
   function Divide(A, B : Integer) return Float;

end Math_Operations;