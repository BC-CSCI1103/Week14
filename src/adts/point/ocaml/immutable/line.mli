(* file: line.mli
 * author: Bob Muller
 * date: January 2020
 *
 * This file contains a specification (signature) of a simple
 * ADT for lines in the 2D plane.
*)
type t

val make : Point.t -> Point.t -> t
val getP1 : t -> Point.t
val getP2 : t -> Point.t
val format : t -> string
val length : t -> float
val midpoint : t -> Point.t
val compare : t -> t -> int
val equal : t -> t -> bool
val move : t -> float -> float -> t
