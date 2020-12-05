(* file: test.ml
 * author: Bob Muller
 * date: November 30, 2014
 *
 * A test harness for the point and line ADTs.
 *
 * This code is configured to be run from the command line. Type
 *
 * > ocamlc -o test point.mli point.ml line.mli line.ml test.ml
 * > ./test
 *)

open Point
open Line

let test() =
  let p1 = Point.make 0.0 0.0 in
  let p2 = Point.make 0.5 0.5 in
  let line = Line.make p1 p2
  in
    print_endline (Line.format line)

let _ = test ()
