-- Пакет для математических операций
package Math_Operations_Package is

   -- Функция для сложения двух чисел
   function Add(A, B : Float) return Float;
   
   -- Функция для вычитания двух чисел
   function Subtract(A, B : Float) return Float;
   
   -- Функция для умножения двух чисел
   function Multiply(A, B : Float) return Float;
   
   -- Функция для деления двух чисел
   function Divide(A, B : Float) return Float;
   
   -- Функция для возведения в степень
   function Power(Base, Exponent : Float) return Float;
   
   -- Функция для вычисления квадратного корня
   function Sqrt(Value : Float) return Float;

end Math_Operations_Package;