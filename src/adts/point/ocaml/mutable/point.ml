(* file: point.ml
 * author: Bob Muller
 * date: January 2020
 *
 * An implementation for a type of MUTABLE points on the 2D plane.
*)
type t = { mutable x : float
         ; mutable y : float
         }

let make x y = { x; y }

let getX p = p.x
let getY p = p.y

let format p =
  Printf.sprintf "(%f, %f)" (getX p) (getY p)

let distance p =
  sqrt((getX p) ** 2.0 +. (getY p) ** 2.0)

let closeEnough a b = abs_float(a -. b) < 1e-8

(* sign : float -> {-1, 0, +1}
 *
 * (sign x) determines the sign of x. An internal helper.
 *)
let sign float =
  match (float < 0.0, closeEnough float 0.0) with
  | (true, _)      -> -1
	| (false, true)  ->  0
	| (false, false) ->  1

(* A lexicographic ordering
*)
let compare p1 p2 =
  let (x1, y1) = (getX p1, getY p1) in
  let (x2, y2) = (getX p2, getY p2) in
  let xSign = sign (x1 -. x2)
  in
	match xSign != 0 with
  | true  -> xSign
	| false -> sign (y1 -. y2)

(* Forcing equal to be consistent with compare by fiat.
*)
let equal p1 p2 = (compare p1 p2) = 0

(* These points are immutable.
*)
let move point dx dy =
  point.x <- (getX point) +. dx;
  point.y <- (getY point) +. dy
