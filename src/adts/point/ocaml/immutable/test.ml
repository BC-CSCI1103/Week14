(* file: test.ml
 * author: Bob Muller
 * date: January 2020
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
  let line1 = Line.make p1 p2 in
  let line2 = Line.move line1 1.0 1.0 in
  let (one, two) = (Line.format line1, Line.format line2)
  in
  Printf.printf "line1 = %s\nline2 = %s\n" one two


let _ = test ()
