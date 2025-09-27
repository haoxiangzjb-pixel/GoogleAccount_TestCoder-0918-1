-- math_operations-af3b1e.adb
-- Тело пакета Ada для базовых математических операций

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

   procedure Divide(Dividend : Integer; Divisor : Integer; Result : out Integer; Remainder : out Integer) is
   begin
      if Divisor = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      Result := Dividend / Divisor;
      Remainder := Dividend rem Divisor;
   end Divide;

end Math_Operations;