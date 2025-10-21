(* OCaml module for mathematical functions *)
module MathFunctions = struct
  (* Basic arithmetic operations *)
  let add x y = x +. y
  let subtract x y = x -. y
  let multiply x y = x *. y
  let divide x y = 
    if y = 0.0 then 
      failwith "Division by zero"
    else 
      x /. y

  (* Power and root functions *)
  let power base exponent = base ** exponent
  let square x = x *. x
  let cube x = x *. x *. x
  let sqrt x = 
    if x < 0.0 then 
      failwith "Square root of negative number"
    else 
      sqrt x

  (* Trigonometric functions *)
  let sin x = sin x
  let cos x = cos x
  let tan x = tan x
  let asin x = asin x
  let acos x = acos x
  let atan x = atan x

  (* Logarithmic functions *)
  let log x = 
    if x <= 0.0 then 
      failwith "Logarithm of non-positive number"
    else 
      log x
  let log10 x = 
    if x <= 0.0 then 
      failwith "Log10 of non-positive number"
    else 
      log10 x
  let exp x = exp x

  (* Absolute value and sign *)
  let abs x = if x >= 0.0 then x else -. x
  let sign x = 
    if x > 0.0 then 1.0
    else if x < 0.0 then -1.0
    else 0.0

  (* Maximum and minimum *)
  let max x y = if x >= y then x else y
  let min x y = if x <= y then x else y

  (* Constants *)
  let pi = 3.14159265358979323846
  let e = 2.71828182845904523536
end

(* Example usage *)
let () =
  let result = MathFunctions.add 5.0 3.0 in
  Printf.printf "5 + 3 = %f\n" result;
  
  let result = MathFunctions.multiply 4.0 6.0 in
  Printf.printf "4 * 6 = %f\n" result;
  
  let result = MathFunctions.sqrt 16.0 in
  Printf.printf "sqrt(16) = %f\n" result;
  
  let result = MathFunctions.sin MathFunctions.pi /. 2.0 in
  Printf.printf "sin(pi/2) = %f\n" result;