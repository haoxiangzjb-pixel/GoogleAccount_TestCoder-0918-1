package body Ada_Math is
   -- Функция для сложения двух чисел
   function Add(A, B : in Float) return Float is
   begin
      return A + B;
   end Add;
   
   -- Функция для вычитания двух чисел
   function Subtract(A, B : in Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   -- Функция для умножения двух чисел
   function Multiply(A, B : in Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   -- Функция для деления двух чисел
   function Divide(A, B : in Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   -- Функция для возведения в степень (целочисленная степень)
   function Power(Base : in Float; Exponent : in Integer) return Float is
      Result : Float := 1.0;
      Abs_Exponent : Natural := abs(Exponent);
   begin
      for I in 1..Abs_Exponent loop
         Result := Result * Base;
      end loop;
      
      if Exponent < 0 then
         return 1.0 / Result;
      else
         return Result;
      end if;
   end Power;
   
   -- Функция для вычисления квадратного корня (метод Ньютона)
   function Sqrt(Value : in Float) return Float is
      X : Float := Value;
      Tolerance : constant Float := 1.0E-7;
      Temp : Float;
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      elsif Value = 0.0 then
         return 0.0;
      else
         loop
            Temp := X;
            X := 0.5 * (X + Value / X);  -- метод Ньютона
            exit when abs(X - Temp) < Tolerance;
         end loop;
         return X;
      end if;
   end Sqrt;
end Ada_Math;