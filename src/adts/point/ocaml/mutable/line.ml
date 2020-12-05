(* file: line.ml
 * author: Bob Muller
 * date: January 2020
 *
 * This file contains an implementation (structure) of a simple
 * ADT for lines in the 2D plane.
*)

type t = { mutable p1 : Point.t  (* choosing a record with 2 floats for t *)
         ; mutable p2 : Point.t
         }

let make p1 p2 = { p1; p2 }

let getP1 line = line.p1
let getP2 line = line.p2

let format line =
  let p1s = Point.format (getP1 line) in
  let p2s = Point.format (getP2 line)
  in
  Printf.sprintf "{p1 = %s; p2 = %s}" p1s p2s

let length line =
  let (x1, y1) = (Point.getX(getP1 line), Point.getY(getP1 line)) in
  let (x2, y2) = (Point.getX(getP2 line), Point.getY(getP2 line)) in
  let rise = (y2 -. y1) in
  let run =  (x2 -. x1)
  in
	sqrt(rise ** 2.0 +. run ** 2.0)

let midpoint line =
  let (x1, y1) = (Point.getX(getP1 line), Point.getY(getP1 line)) in
  let (x2, y2) = (Point.getX(getP2 line), Point.getY(getP2 line))
  in
	Point.make ((x1 +. x2) /. 2.0) ((y1 +. y2) /. 2.0)

let compare line1 line2 =
  let l1mp = midpoint line1 in
  let l2mp = midpoint line2
  in
	Point.compare l1mp l2mp

let equal line1 line2 = (compare line1 line2) = 0

let move line dx dy =
  Point.move (getP1 line) dx dy;
  Point.move (getP2 line) dx dy
