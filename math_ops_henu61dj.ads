package Math_Ops is
   -- Пакет для математических операций

   -- Функция сложения двух целых чисел
   function Add (A, B : Integer) return Integer;

   -- Функция вычитания двух целых чисел
   function Subtract (A, B : Integer) return Integer;

   -- Функция умножения двух целых чисел
   function Multiply (A, B : Integer) return Integer;

   -- Функция деления двух целых чисел
   function Divide (A, B : Integer) return Integer;

   -- Функция возведения в степень
   function Power (Base : Integer; Exponent : Natural) return Integer;

   -- Функция вычисления факториала
   function Factorial (N : Natural) return Integer;

   -- Функция вычисления абсолютного значения
   function Absolute_Value (X : Integer) return Integer;

   -- Функция проверки на простое число
   function Is_Prime (N : Integer) return Boolean;

   -- Функция вычисления наибольшего общего делителя
   function GCD (A, B : Integer) return Integer;

   -- Функция вычисления наименьшего общего кратного
   function LCM (A, B : Integer) return Integer;

end Math_Ops;
