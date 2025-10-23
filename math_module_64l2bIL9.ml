(* OCaml module encapsulating mathematical functions *)
module MathFunctions = struct
  (* Basic arithmetic operations *)
  let add x y = x + y
  let subtract x y = x - y
  let multiply x y = x * y
  let divide x y = 
    if y = 0 then failwith "Division by zero" 
    else x / y

  (* Power function *)
  let power base exp =
    let rec aux acc n =
      if n = 0 then acc
      else aux (acc * base) (n - 1)
    in
    aux 1 exp

  (* Square root using Newton's method *)
  let sqrt x =
    if x < 0 then failwith "Square root of negative number"
    else
      let rec aux guess =
        let new_guess = (guess +. x /. guess) /. 2.0 in
        if abs_float (new_guess -. guess) < 0.000001 then new_guess
        else aux new_guess
      in
      aux 1.0

  (* Factorial *)
  let factorial n =
    let rec aux acc i =
      if i <= 1 then acc
      else aux (acc * i) (i - 1)
    in
    if n < 0 then failwith "Factorial of negative number"
    else aux 1 n

  (* Greatest Common Divisor *)
  let gcd a b =
    let rec aux x y =
      if y = 0 then x
      else aux y (x mod y)
    in
    aux (abs a) (abs b)

  (* Least Common Multiple *)
  let lcm a b =
    if a = 0 || b = 0 then 0
    else abs (a * b) / (gcd a b)

  (* Check if a number is prime *)
  let is_prime n =
    let rec aux divisor =
      if divisor * divisor > n then true
      else if n mod divisor = 0 then false
      else aux (divisor + 1)
    in
    if n <= 1 then false
    else if n = 2 then true
    else if n mod 2 = 0 then false
    else aux 3

  (* Fibonacci sequence *)
  let fibonacci n =
    let rec aux a b i =
      if i = 0 then a
      else aux b (a + b) (i - 1)
    in
    if n < 0 then failwith "Fibonacci of negative number"
    else aux 0 1 n
end

(* Example usage *)
let () =
  Printf.printf "5 + 3 = %d\n" (MathFunctions.add 5 3);
  Printf.printf "5 - 3 = %d\n" (MathFunctions.subtract 5 3);
  Printf.printf "5 * 3 = %d\n" (MathFunctions.multiply 5 3);
  Printf.printf "6 / 2 = %d\n" (MathFunctions.divide 6 2);
  Printf.printf "2^8 = %d\n" (MathFunctions.power 2 8);
  Printf.printf "Factorial of 5 = %d\n" (MathFunctions.factorial 5);
  Printf.printf "GCD of 48 and 18 = %d\n" (MathFunctions.gcd 48 18);
  Printf.printf "LCM of 4 and 6 = %d\n" (MathFunctions.lcm 4 6);
  Printf.printf "Is 17 prime? %b\n" (MathFunctions.is_prime 17);
  Printf.printf "10th Fibonacci number = %d\n" (MathFunctions.fibonacci 10)