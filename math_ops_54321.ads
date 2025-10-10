-- Пакет для базовых математических операций
package Math_Operations is
   -- Функция для сложения двух целых чисел
   function Add(A, B : Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B : Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B : Integer) return Integer;

   -- Функция для деления двух целых чисел (деление нацело)
   function Divide(A, B : Integer) return Integer
     with Pre => B /= 0; -- Предусловие: делитель не равен нулю

   -- Процедура для вычисления квадрата числа
   procedure Square(X : in out Integer);
end Math_Operations;

-- Тело пакета
package body Math_Operations is
   function Add(A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;

   function Subtract(A, B : Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   function Multiply(A, B : Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   function Divide(A, B : Integer) return Integer is
   begin
      return A / B;
   end Divide;

   procedure Square(X : in out Integer) is
   begin
      X := X * X;
   end Square;
end Math_Operations;