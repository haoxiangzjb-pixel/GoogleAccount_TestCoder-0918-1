(* OCaml module for mathematical functions *)
module Math = struct
  (* Basic arithmetic operations *)
  let add x y = x + y
  let subtract x y = x - y
  let multiply x y = x * y
  let divide x y = 
    if y = 0 then failwith "Division by zero"
    else x / y

  (* Power and exponential functions *)
  let power base exp = 
    if exp < 0 then 
      failwith "Negative exponents not supported for integer base"
    else
      let rec pow acc n = 
        if n = 0 then acc
        else pow (acc * base) (n - 1)
      in pow 1 exp

  let square x = x * x
  let cube x = x * x * x

  (* Trigonometric functions (using standard library) *)
  let sin = Stdlib.sin
  let cos = Stdlib.cos
  let tan x = Stdlib.tan x

  (* Logarithmic functions *)
  let log = Stdlib.log
  let log10 = Stdlib.log10
  let exp = Stdlib.exp

  (* Constants *)
  let pi = Stdlib.pi
  let e = exp 1.0

  (* Absolute value *)
  let abs x = if x < 0 then -x else x

  (* Maximum and minimum *)
  let max x y = if x > y then x else y
  let min x y = if x < y then x else y

  (* Factorial *)
  let factorial n = 
    if n < 0 then failwith "Factorial not defined for negative numbers"
    else
      let rec fact acc i = 
        if i <= 1 then acc
        else fact (acc * i) (i - 1)
      in fact 1 n

  (* Greatest Common Divisor *)
  let rec gcd a b = 
    if b = 0 then abs a
    else gcd b (a mod b)

  (* Least Common Multiple *)
  let lcm a b = 
    if a = 0 || b = 0 then 0
    else abs (a * b) / (gcd a b)
end