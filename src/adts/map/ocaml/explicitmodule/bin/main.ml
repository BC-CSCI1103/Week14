(* file: test.ml
   author: Bob Muller

   CSCI 1103 Computer Science 1 Honors

   This file is a simple client for the Map ADT. In this case
   the Map module is written explicitly.

Usage:
   > cd src
   > dune exec bin/main.exe
*)
module type MAP =
sig
  type key = string
  type 'a t

  val empty : 'a t
  val add : key -> 'a -> 'a t -> 'a t
  val find : key -> 'a t -> 'a
end

module Map : MAP =
struct
  type key = string
  type 'a t = (key * 'a) list

  let empty = []
  let add key value map = (key, value) :: map

  let rec find key map =
    match map with
    | [] -> failwith "Bad"
    | (key1, value) :: map ->
      if key1 = key then value else find key map
end

let main (args : string array) : unit =
  let myMap = Map.empty |> Map.add "Alice" 12 |> Map.add "Bob" 10
  in
  Lib.pfmt "Bob = %d\n" (Map.find "Bob" myMap)

let _ = main Sys.argv
