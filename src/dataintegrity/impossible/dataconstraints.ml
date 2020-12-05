(* file: dataconstraints.ml
   author: Bob Muller

   CSCI 3366 Programming Languages

   This file contains OCaml code showing the benefits of defining data
   structures in such a way that consistency constraints between data values
   are exposed to the type system.  The example is couched in terms of
   student records. The constraint at issue is that all full-time students
   have an expected graduation date and no part-time students have
   expected graduation dates.  In the first, badly designed types below
   the classOf field is of type int option.  A violation of this constraint
   would be discovered at run time. In the second, better designed set of
   types below that, an either/or type is used (FullTime vs PartTime) so
   a hypotheical example violating the constraint would be ill-typed, meaning
   that the compiler will not generate code.

   See e.g., https://www.youtube.com/watch?v=IcgmSRJHu_8 or
   https://gist.github.com/busypeoples/ab2f993843f23614232a1f8500a4b542 or
   https://vimeo.com/21564387
*)
type school = AandS | CSOM | Nursing | Education | Woods

type dept = CSCI | ECON | MATH (* etc *)

(* Undergrads & grads are full-time, all full-time students have expected
   graduation years. *)
type enrollment = Undergraduate | Graduate | PartTime

type status = Admitted | Enrolled | Alumnus | Other

type student = { name : string
               ; id : int
               ; school : school
               ; enrollment : enrollment
               ; classOf : int option
               ; status : status
               ; major : dept
               }

let alice = { name = "Alice"              (* Good to go *)
            ; id = 555
            ; school = AandS
            ; enrollment = Undergraduate
            ; classOf = Some 2021
            ; status = Enrolled
            ; major = MATH
            }

let bob = { name = "Bob"
          ; id = 343
          ; school = AandS
          ; enrollment = PartTime
          ; classOf = Some 2022       (* NB: Bad data! classOf field *)
          ; status = Enrolled         (* for part-timers should be None *)
          ; major = CSCI
          }

(***************************************************************
   A simple re-org of the data structure exposes inconsistent data
   to the type checker. (!)

   Type student was an AND type with a classOf field of OR type.
   Make student an OR type of AND types.
*)
type enrollment = Undergraduate | Graduate

type student = FullTime of { name : string
                           ; id : int
                           ; school : school
                           ; enrollment : enrollment
                           ; classOf : int           (* NB! not an option *)
                           ; status : status
                           ; major : dept
                           }
             | PartTime of { name : string           (* NB: no classOf field *)
                           ; id : int
                           ; school : school
                           ; status : status
                           ; major : dept
                           }

let alice = FullTime { name = "Alice"              (* Good to go *)
                     ; id = 555
                     ; school = AandS
                     ; enrollment = Undergraduate
                     ; classOf = 2019
                     ; status = Enrolled
                     ; major = MATH
                     }

let s1 = PartTime { name = "Bob"
                  ; id = 343
                  ; school = CSOM
                  ; classOf = 2018                (* formerly None *)
                  ; status = Enrolled
                  ; major = ECON
                  }
