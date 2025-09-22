-- Package specification for mathematical operations
package Math_Operations is
   
   -- Function to add two numbers
   function Add(A, B : Float) return Float;
   
   -- Function to subtract two numbers
   function Subtract(A, B : Float) return Float;
   
   -- Function to multiply two numbers
   function Multiply(A, B : Float) return Float;
   
   -- Function to divide two numbers
   function Divide(A, B : Float) return Float;
   
   -- Function to calculate the power of a number
   function Power(Base, Exponent : Float) return Float;
   
   -- Function to calculate the square root of a number
   function Square_Root(X : Float) return Float;
   
end Math_Operations;

-- Package body for mathematical operations
package body Math_Operations is
   
   function Add(A, B : Float) return Float is
   begin
      return A + B;
   end Add;
   
   function Subtract(A, B : Float) return Float is
   begin
      return A - B;
   end Subtract;
   
   function Multiply(A, B : Float) return Float is
   begin
      return A * B;
   end Multiply;
   
   function Divide(A, B : Float) return Float is
   begin
      if B = 0.0 then
         raise Constraint_Error with "Division by zero";
      end if;
      return A / B;
   end Divide;
   
   function Power(Base, Exponent : Float) return Float is
      result : Float := 1.0;
   begin
      -- Simple implementation for integer exponents
      if Exponent = 0.0 then
         return 1.0;
      elsif Exponent > 0.0 then
         for I in 1 .. Integer(Exponent) loop
            result := result * Base;
         end loop;
         return result;
      else
         for I in 1 .. Integer(-Exponent) loop
            result := result * Base;
         end loop;
         return 1.0 / result;
      end if;
   end Power;
   
   function Square_Root(X : Float) return Float is
      guess : Float := X / 2.0;
      epsilon : constant Float := 0.00001;
   begin
      if X < 0.0 then
         raise Constraint_Error with "Cannot calculate square root of negative number";
      end if;
      
      if X = 0.0 then
         return 0.0;
      end if;
      
      -- Newton's method for finding square root
      while abs(guess * guess - X) > epsilon loop
         guess := (guess + X / guess) / 2.0;
      end loop;
      
      return guess;
   end Square_Root;
   
end Math_Operations;