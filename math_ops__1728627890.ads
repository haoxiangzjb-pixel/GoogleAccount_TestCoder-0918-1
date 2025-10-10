package Math_Operations is

   -- Функция для сложения двух чисел
   function Add(A, B : in Float) return Float;

   -- Функция для вычитания двух чисел
   function Subtract(A, B : in Float) return Float;

   -- Функция для умножения двух чисел
   function Multiply(A, B : in Float) return Float;

   -- Функция для деления двух чисел
   function Divide(A, B : in Float) return Float;

end Math_Operations;

package body Math_Operations is

   function Add(A, B : in Float) return Float is
   begin
      return A + B;
   end Add;

   function Subtract(A, B : in Float) return Float is
   begin
      return A - B;
   end Subtract;

   function Multiply(A, B : in Float) return Float is
   begin
      return A * B;
   end Multiply;

   function Divide(A, B : in Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;

end Math_Operations;