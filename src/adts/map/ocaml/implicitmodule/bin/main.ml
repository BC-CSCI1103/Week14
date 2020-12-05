(* file: test.ml
   author: Bob Muller

   CSCI 1103 Computer Science 1 Honors

   This file is a simple client for the Map ADT.

Usage:
   > cd src
   > dune exec bin/main.exe
*)
let main (args : string array) : unit =
  let myMap = Map.empty |> Map.add "Alice" 12 |> Map.add "Bob" 10
  in
  Lib.pfmt "Bob = %d\n" (Map.find "Bob" myMap)

let _ = main Sys.argv
