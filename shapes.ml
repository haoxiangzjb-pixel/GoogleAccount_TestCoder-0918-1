(* Definición de un tipo algebraico en OCaml para representar formas *)
type forma = 
  | Circulo of float          (* radio *)
  | Rectangulo of float * float (* ancho * alto *)
  | Triangulo of float * float * float (* tres lados *)
  | Cuadrado of float         (* lado *)

(* Ejemplos de uso *)
let circulo_unitario = Circulo 1.0
let rectangulo_ejemplo = Rectangulo (3.0, 4.0)
let triangulo_ejemplo = Triangulo (3.0, 4.0, 5.0)
let cuadrado_ejemplo = Cuadrado 5.0

(* Función para calcular el área de una forma *)
let area forma = 
  match forma with
  | Circulo r -> 3.14159 *. r *. r
  | Rectangulo (w, h) -> w *. h
  | Cuadrado s -> s *. s
  | Triangulo (a, b, c) -> 
      (* Fórmula de Herón para el área de un triángulo *)
      let s = (a +. b +. c) /. 2.0 in
      sqrt (s *. (s -. a) *. (s -. b) *. (s -. c))