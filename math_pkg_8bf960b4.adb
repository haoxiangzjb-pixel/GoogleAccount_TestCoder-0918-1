package body Math_Ops is

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

   function Power(Base : Integer; Exponent : Natural) return Integer is
      Result : Integer := 1;
      Abs_Base : Integer := Base;
   begin
      if Exponent = 0 then
         return 1;
      end if;
      
      if Base < 0 and (Exponent mod 2 = 1) then
         Abs_Base := -Base;
         for I in 1..Exponent loop
            Result := Result * Abs_Base;
         end loop;
         return -Result;
      else
         Abs_Base := abs Base;
         for I in 1..Exponent loop
            Result := Result * Abs_Base;
         end loop;
         return Result;
      end if;
   end Power;

   function Factorial(N : Natural) return Integer is
      Result : Integer := 1;
   begin
      for I in 1..N loop
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

   function Square_Root(N : Natural) return Float is
      X : Float := Float(N);
      Y : Float := 1.0;
      Precision : constant Float := 0.00001;
   begin
      if N = 0 then
         return 0.0;
      end if;
      
      while abs(X - Y) > Precision loop
         X := (X + Y) / 2.0;
         Y := Float(N) / X;
      end loop;
      return X;
   end Square_Root;

   function Absolute_Value(N : Integer) return Integer is
   begin
      return abs N;
   end Absolute_Value;

end Math_Ops;