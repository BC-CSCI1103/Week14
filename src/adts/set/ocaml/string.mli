type t = string

val make : int -> char -> string
val copy : string -> string
val sub : string -> int -> int -> string
val concat : string -> string list -> string
val map : (char -> char) -> string -> string
val trim : string -> string
val index : string -> char -> int
val contains : string -> char -> bool
val split_on_char : char -> string -> string list
(* ... *)
val compare : String.t -> String.t -> int
val equal : String.t -> String.t -> bool
