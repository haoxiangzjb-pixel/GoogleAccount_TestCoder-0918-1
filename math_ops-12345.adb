-- Ada package body for mathematical operations
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
      Base_Copy : Integer := Base;
   begin
      if Exponent = 0 then
         return 1;
      end if;
      
      while Exp > 0 loop
         if Exp mod 2 = 1 then
            Result := Result * Base_Copy;
         end if;
         Base_Copy := Base_Copy * Base_Copy;
         Exp := Exp / 2;
      end loop;
      
      return Result;
   end Power;
   
   function Absolute_Value(Num : Integer) return Integer is
   begin
      if Num < 0 then
         return -Num;
      else
         return Num;
      end if;
   end Absolute_Value;
   
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
   
   function Factorial(N : Natural) return Natural is
      Result : Natural := 1;
      I : Natural := 1;
   begin
      while I <= N loop
         Result := Result * I;
         I := I + 1;
      end loop;
      return Result;
   end Factorial;
   
end Math_Ops;