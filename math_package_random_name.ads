-- Пакет для математических операций
package Math_Package is

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

end Math_Package;

-- Тело пакета
package body Math_Package is

   function Add(A, B : Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power(Base, Exponent : Float) return Float is
      Result : Float := 1.0;
      I : Integer := Integer(Exponent);
   begin
      -- Простая реализация для целочисленных степеней
      if Exponent = Float(I) then
         if I >= 0 then
            for J in 1..I loop
               Result := Result * Base;
            end loop;
         else
            Result := 1.0 / Power(Base, Float(-I));
         end if;
      else
         -- Для нецелых степеней используем приближенное значение
         -- или вызываем внешнюю библиотеку, здесь упрощенная версия
         Result := Base ** Exponent; -- Используем встроенную операцию
      end if;
      return Result;
   end Power;
   
   function Sqrt(Value : Float) return Float is
      X : Float := Value;
      Tolerance : constant Float := 0.000001;
      Guess : Float;
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      
      if Value = 0.0 then
         return 0.0;
      end if;
      
      loop
         Guess := (X + Value / X) / 2.0;
         exit when abs(X - Guess) < Tolerance;
         X := Guess;
      end loop;
      
      return X;
   end Sqrt;

end Math_Package;