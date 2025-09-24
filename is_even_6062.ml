let is_even n =
  n mod 2 = 0

(* Пример использования *)
let () =
  let number = 42 in
  if is_even number then
    Printf.printf "%d is even.\n" number
  else
    Printf.printf "%d is odd.\n" number