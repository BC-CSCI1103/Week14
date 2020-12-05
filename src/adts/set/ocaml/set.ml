(* file: set.ml
 * author: Bob Muller, adapted from Jason Hickey's book
 *
 * CS3366 Programming Languages
 *
 * Facilities for programming in the large in ML:
 *
 * Modules: signatures, structures and functors.
*)
module type SET =
  sig
    type t
    type elt
    val empty : t
    val mem : elt -> t -> bool
    val add : elt -> t -> t
    val size : t -> int
  end

module type EQUAL =
  sig
    type t
    val equal : t -> t -> bool
  end

(* The Make functor accepts a structure of type EQUAL and
 * returns a structure of type SET. The input structure Equal
 * has a type t that must be the same as the type elt in the
 * output structure. The bit "with type elt = Equal.t" ensures
 * that these types are the same.
*)
module Make(Equal : EQUAL) : SET with type elt = Equal.t =
  struct
    type elt = Equal.t
    type t = elt list
    let empty = []
    let mem item set = List.exists (Equal.equal item) set
    let add item set = (item::set)
    let size = List.length
  end

module StringEq =
  struct
    type t = string
    let equal s1 s2 = (String.compare s1 s2) = 0
  end

module IntEq =
  struct
    type t = int
    let equal n1 n2 = n1 = n2
  end

module IntSet =    Make(IntEq)
module StringSet = Make(StringEq)

let is = IntSet.add 343 IntSet.empty
let ss = StringSet.add "Hello" StringSet.empty
