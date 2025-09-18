-- Ada Package for Mathematical Operations
-- File: RONHCnrZ3f.adb

package Math_Operations is
   -- Function to add two integers
   function Add(A, B : Integer) return Integer;
   
   -- Function to subtract two integers
   function Subtract(A, B : Integer) return Integer;
   
   -- Function to multiply two integers
   function Multiply(A, B : Integer) return Integer;
   
   -- Function to divide two integers
   function Divide(A, B : Integer) return Float;
   
   -- Function to calculate the power of an integer
   function Power(Base : Integer; Exponent : Natural) return Integer;
   
   -- Function to calculate the factorial of a number
   function Factorial(N : Natural) return Integer;
   
end Math_Operations;

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
   
   function Divide(A, B : Integer) return Float is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return Float(A) / Float(B);
   end Divide;
   
   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
   begin
      for I in 1 .. Exponent loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;
   
   function Factorial(N : Natural) return Integer is
      Result : Integer := 1;
   begin
      if N = 0 then
         return 1;
      else
         for I in 1 .. N loop
            Result := Result * I;
         end loop;
         return Result;
      end if;
   end Factorial;
   
end Math_Operations;