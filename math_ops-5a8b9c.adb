--  Math_Ops package body
with Ada.Numerics.Generic_Elementary_Functions;

package body Math_Ops is

   -- Function to add two numbers
   function Add(A, B : in Float) return Float is
   begin
      return A + B;
   end Add;
   
   -- Function to subtract two numbers
   function Subtract(A, B : in Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   -- Function to multiply two numbers
   function Multiply(A, B : in Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   -- Function to divide two numbers
   function Divide(A, B : in Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   -- Function to calculate power of a number
   function Power(Base : in Float; Exponent : in Integer) return Float is
      Result : Float := 1.0;
      Abs_Exponent : Natural := abs(Exponent);
   begin
      for I in 1 .. Abs_Exponent loop
         Result := Result * Base;
      end loop;
      
      if Exponent < 0 then
         return 1.0 / Result;
      else
         return Result;
      end if;
   end Power;
   
   -- Function to calculate square root
   function Square_Root(Value : in Float) return Float is
      package Float_Functions is new Ada.Numerics.Generic_Elementary_Functions(Float);
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      return Float_Functions.Sqrt(Value);
   end Square_Root;

end Math_Ops;