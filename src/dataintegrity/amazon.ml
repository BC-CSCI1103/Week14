(* file: amazon.ml
   author: Bob Muller

   CSCI 1103 Computer Science 1 Honors

   This exhibits a real-world case in which the type checker can't
   rule out an error. Early on in Amazon's code, one could order a
   negative number of books.

   This kind of data integrity constraint can be checked at run-time
   using the assert special-form.
*)
type product = Book of { title : string
                       ; author : string
                       ; price : float
                       }
             | OneDollarWidget

type sale = { product : product
            ; quantity : int
            }

let charge { product; quantity } =
  assert (quantity > 0);            (* Make sure this is reasonable. *)
  let quantity = float quantity
  in
  match product with
  | Book {price} -> price *. quantity
  | OneDollarWidget -> quantity

let wrath = Book { title = "The Grapes of Wrath"
                 ; author = "John Steinbeck"
                 ; price = 30.0
                 }

let mysale = { product = wrath
             ; quantity = -100       (* Heads up! *)
             }
