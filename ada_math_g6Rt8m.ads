package Ada_Math is
   -- Функция для сложения двух чисел
   function Add(A, B : in Float) return Float;
   
   -- Функция для вычитания двух чисел
   function Subtract(A, B : in Float) return Float;
   
   -- Функция для умножения двух чисел
   function Multiply(A, B : in Float) return Float;
   
   -- Функция для деления двух чисел
   function Divide(A, B : in Float) return Float;
   
   -- Функция для возведения в степень (целочисленная степень)
   function Power(Base : in Float; Exponent : in Integer) return Float;
   
   -- Функция для вычисления квадратного корня
   function Sqrt(Value : in Float) return Float;
   
private
   -- Внутренние переменные и типы (если необходимы)
   Dummy : constant Float := 0.0;
end Ada_Math;