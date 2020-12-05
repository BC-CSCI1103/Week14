(* file: stringSet.ml
 * author: Bob Muller, adapted from Jason Hickey's book
 *
 * CS3366 Programming Languages
 *
 * Facilities for programming in the large in ML:
 *
 * Modules: signatures, structures and functors.
*)
module type STRING_SET =
  sig
    type t
    val empty : t
    val mem : String.t -> t -> bool
    val size : t -> int
    val add : String.t -> t -> t
  end

module StringSet : STRING_SET =
  struct
    type elt = String.t
    type t = elt list
    let empty = []
    let mem = List.mem
    let size = List.length
    let add item s = (item::s)
  end
