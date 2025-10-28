-- Ada package body for mathematical operations
with Ada.Numerics; use Ada.Numerics;

package body Ojsxivncta is

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
   
   function Divide(A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;
   
   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Temp_Base : Integer := Base;
      Temp_Exponent : Natural := Exponent;
   begin
      while Temp_Exponent > 0 loop
         if Temp_Exponent mod 2 = 1 then
            Result := Result * Temp_Base;
         end if;
         Temp_Base := Temp_Base * Temp_Base;
         Temp_Exponent := Temp_Exponent / 2;
      end loop;
      return Result;
   end Power;
   
   function Square_Root(Value : Float) return Float is
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      return Sqrt(Value);
   end Square_Root;
   
   function Max(A, B : Integer) return Integer is
   begin
      if A > B then
         return A;
      else
         return B;
      end if;
   end Max;
   
   function Min(A, B : Integer) return Integer is
   begin
      if A < B then
         return A;
      else
         return B;
      end if;
   end Min;

end Ojsxivncta;