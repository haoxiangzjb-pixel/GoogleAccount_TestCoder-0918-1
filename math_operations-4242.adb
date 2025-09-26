-- Пакет Ada для базовых математических операций
package Math_Operations is
   -- Функция для сложения двух целых чисел
   function Add(A, B: Integer) return Integer;

   -- Функция для вычитания двух целых чисел
   function Subtract(A, B: Integer) return Integer;

   -- Функция для умножения двух целых чисел
   function Multiply(A, B: Integer) return Integer;

   -- Функция для деления двух целых чисел (деление нацело)
   function Divide(A, B: Integer) return Integer;

   -- Процедура для вывода приветственного сообщения
   procedure Print_Welcome_Message;
end Math_Operations;

-- Тело пакета
package body Math_Operations is
   function Add(A, B: Integer) return Integer is
   begin
      return A + B;
   end Add;

   function Subtract(A, B: Integer) return Integer is
   begin
      return A - B;
   end Subtract;

   function Multiply(A, B: Integer) return Integer is
   begin
      return A * B;
   end Multiply;

   function Divide(A, B: Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;

   procedure Print_Welcome_Message is
   begin
      Put_Line("Добро пожаловать в пакет Math_Operations!");
   end Print_Welcome_Message;
end Math_Operations;