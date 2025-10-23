--  Math_Ops package specification
package Math_Ops is

   -- Function to add two numbers
   function Add(A, B : in Float) return Float;
   
   -- Function to subtract two numbers
   function Subtract(A, B : in Float) return Float;
   
   -- Function to multiply two numbers
   function Multiply(A, B : in Float) return Float;
   
   -- Function to divide two numbers
   function Divide(A, B : in Float) return Float;
   
   -- Function to calculate power of a number
   function Power(Base : in Float; Exponent : in Integer) return Float;
   
   -- Function to calculate square root
   function Square_Root(Value : in Float) return Float;

end Math_Ops;