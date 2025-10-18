-- Пример использования пакета математических операций
with Ada.Text_IO; use Ada.Text_IO;
with Math_Operations_Package; use Math_Operations_Package;

procedure Example_Usage is
   Result : Float;
begin
   -- Примеры использования функций
   Result := Add(5.0, 3.0);
   Put_Line("5 + 3 = " & Float'Image(Result));
   
   Result := Subtract(10.0, 4.0);
   Put_Line("10 - 4 = " & Float'Image(Result));
   
   Result := Multiply(6.0, 7.0);
   Put_Line("6 * 7 = " & Float'Image(Result));
   
   Result := Divide(15.0, 3.0);
   Put_Line("15 / 3 = " & Float'Image(Result));
   
   Result := Power(2.0, 8.0);
   Put_Line("2 ^ 8 = " & Float'Image(Result));
   
   Result := Sqrt(16.0);
   Put_Line("sqrt(16) = " & Float'Image(Result));
   
   -- Обработка ошибок
   begin
      Result := Divide(10.0, 0.0);
   exception
      when Constraint_Error =>
         Put_Line("Ошибка: деление на ноль!");
   end;
   
   begin
      Result := Sqrt(-4.0);
   exception
      when Constraint_Error =>
         Put_Line("Ошибка: квадратный корень из отрицательного числа!");
   end;
   
   Put_Line("Пример выполнения завершен.");
end Example_Usage;