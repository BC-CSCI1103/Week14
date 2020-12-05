(* file: point.ml
   author: Bob Muller

   Message-passing style with records & arrows.
*)
type t = { x : int
         ; y : int
         ; toString : t -> string
         ; move : t * int * int -> t
         }

let toString this = Lib.fmt "(%d, %d)" this.x this.y

let move(this, dx, dy) = { this with x = this.x + dx
                                   ; y = this.y + dy
                         }

let newPoint (x, y) = { x; y; toString; move }

let main (args : string array) : unit =
  let p1 = newPoint(2, 3) in
  let p2 = p1.move(p1, 4, 5) in
  let p1s = p1.toString(p1) in
  let p2s = p2.toString(p2)
  in
  Printf.printf "p1 = %s, p2 = %s\n" p1s p2s

let _ = main Sys.argv
