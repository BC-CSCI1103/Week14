
type t = { double : int -> int }

let artifact = 
  { double = (fun n -> n * 2)
  }

let _ : int -> int = artifact.double

let _ : int = artifact.double(5)
