package body Y623t6mq is

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
      Exp : Natural := Exponent;
   begin
      while Exp > 0 loop
         Result := Result * Base;
         Exp := Exp - 1;
      end loop;
      return Result;
   end Power;
   
   function Square_Root(Value : Float) return Float is
      X : Float := Value;
      Y : Float;
      Tolerance : constant Float := 0.00001;
   begin
      if Value < 0.0 then
         raise Constraint_Error with "Square root of negative number";
      end if;
      
      if Value = 0.0 then
         return 0.0;
      end if;
      
      loop
         Y := (X + Value / X) / 2.0;
         exit when abs(Y - X) < Tolerance;
         X := Y;
      end loop;
      
      return Y;
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

end Y623t6mq;