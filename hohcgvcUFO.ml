(* OCaml module for mathematical functions *)
module Math = struct
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
  let ln x = log x
  let log10 x = log10 x
  let log_base base x = (log x) /. (log base)

  (* Constants *)
  let pi = 3.14159265358979323846
  let e = 2.71828182845904523536

  (* Absolute value *)
  let abs x = if x >= 0.0 then x else -. x

  (* Maximum and minimum *)
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y

  (* Factorial *)
  let factorial n =
    if n < 0 then failwith "Factorial of negative number"
    else
      let rec fact acc i =
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in
      fact 1 n

  (* Greatest Common Divisor *)
  let gcd a b =
    let rec gcd_helper a b =
      if b = 0 then abs a
      else gcd_helper b (a mod b)
    in
    gcd_helper (abs a) (abs b)

  (* Least Common Multiple *)
  let lcm a b =
    if a = 0 || b = 0 then 0
    else abs (a * b) / (gcd a b)
end

(* Example usage *)
let () =
  Printf.printf "Testing Math module:\n";
  Printf.printf "Addition: 5.0 + 3.0 = %f\n" (Math.add 5.0 3.0);
  Printf.printf "Square root of 16: %f\n" (Math.sqrt 16.0);
  Printf.printf "Pi constant: %f\n" Math.pi;
  Printf.printf "Factorial of 5: %d\n" (Math.factorial 5);
  Printf.printf "GCD of 12 and 8: %d\n" (Math.gcd 12 8)