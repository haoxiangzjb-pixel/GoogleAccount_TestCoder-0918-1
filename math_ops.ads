package Math_Operations is
   --  Функция для сложения двух чисел
   function Add(A, B : Integer) return Integer;

   --  Функция для вычитания двух чисел
   function Subtract(A, B : Integer) return Integer;

   --  Функция для умножения двух чисел
   function Multiply(A, B : Integer) return Integer;

   --  Функция для деления двух чисел
   --  Вызывает исключение при делении на ноль
   function Divide(Numerator, Denominator : Integer) return Integer;
   Divide_By_Zero_Error : exception;

end Math_Operations;