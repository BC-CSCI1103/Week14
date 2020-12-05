
type product = Book of { title : string
                       ; author : string
                       ; price : float
                       }
             | OneDollarWidget

type sale = { product : product; quantity : int }

let charge { product; quantity } =
  assert (quantity > 0);
  let quantity = float quantity
  in
  match product with
  | Book {price} -> price *. quantity
  | OneDollarWidget -> quantity

let wrath = Book { title = "The Grapes of ..."; author = "JS"; price = 30.0}

let mysale = { product = wrath; quantity = -100 }
