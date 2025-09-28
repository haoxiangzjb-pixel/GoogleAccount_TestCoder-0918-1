let is_even n =
  n mod 2 = 0

let () =
  Printf.printf "%b\n" (is_even 4);
  Printf.printf "%b\n" (is_even 5)