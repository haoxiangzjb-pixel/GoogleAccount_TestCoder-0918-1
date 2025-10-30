package body Math_Package is

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
      Temp_Base : Integer := Base;
      Temp_Exp : Natural := Exponent;
   begin
      while Temp_Exp > 0 loop
         if Temp_Exp mod 2 = 1 then
            Result := Result * Temp_Base;
         end if;
         Temp_Base := Temp_Base * Temp_Base;
         Temp_Exp := Temp_Exp / 2;
      end loop;
      return Result;
   end Power;

   function Square_Root(Value : Natural) return Natural is
      X : Natural := Value;
      Y : Natural := (X + 1) / 2;
   begin
      while Y < X loop
         X := Y;
         Y := (X + Value / X) / 2;
      end loop;
      return X;
   end Square_Root;

end Math_Package;