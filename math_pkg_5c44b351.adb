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

   function Divide(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;

   function Power(Base, Exponent : Integer) return Integer is
      Result : Integer := 1;
      Abs_Exponent : Integer := Exponent;
   begin
      if Exponent < 0 then
         raise Constraint_Error with "Negative exponents not supported";
      end if;
      
      for I in 1 .. Exponent loop
         Result := Result * Base;
      end loop;
      return Result;
   end Power;

   function Factorial(N : Integer) return Integer is
      Result : Integer := 1;
   begin
      if N < 0 then
         raise Constraint_Error with "Negative factorial not supported";
      end if;
      
      for I in 1 .. N loop
         Result := Result * I;
      end loop;
      return Result;
   end Factorial;

   function Modulo(A, B : Integer) return Integer is
   begin
      if B = 0 then
         raise Constraint_Error with "Modulo by zero";
      end if;
      return A mod B;
   end Modulo;

   function Square_Root(N : Integer) return Integer is
      Result : Integer := 0;
   begin
      if N < 0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      
      while Result * Result <= N loop
         Result := Result + 1;
      end loop;
      return Result - 1;
   end Square_Root;
end Math_Operations;