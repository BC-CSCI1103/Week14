(* file: point.mli
 * author: Bob Muller
 * date: January 2020
 *
 * A specification for a type of points on the 2D plane.
 *)
type t   (* there is some representation type t. *)

val make : float -> float -> t
val getX : t -> float
val getY : t -> float
val format : t -> string
val distance : t -> float
val compare : t -> t -> int
val equal : t -> t -> bool
val move : t -> float -> float -> unit
