(*
 * ShangShield.ml by Alyx Shang.
 * Licensed under the FSL v1.
 *)

(*
The documentation for this function
can be found in the provided interface.
*)
let digit_distance (one : int) (two : int) : int =
  if one < two then two - one else one - two

(*
The documentation for this function
can be found in the provided interface.
*)
let char_as_digit (subject : char) : int option =
  match subject with
  | '0' -> Some 0
  | '1' -> Some 1
  | '2' -> Some 2
  | '3' -> Some 3
  | '4' -> Some 4
  | '5' -> Some 5
  | '6' -> Some 6
  | '7' -> Some 7
  | '8' -> Some 8
  | '9' -> Some 9
  | _ -> None

(*
The documentation for this function
can be found in the provided interface.
*)
let rec letter_pos (subject : char) (starter : int) : int =
  let alphabet = "abcdefghijklmnopqrstuvwxyz" in
  let lower = Char.lowercase_ascii subject in
  if starter >= 26 then -1
  else if alphabet.[starter] == lower then starter + 1
  else letter_pos subject (starter + 1)

(*
The documentation for this function
can be found in the provided interface.
*)
let is_number (subject : char) : bool =
  let casted = char_as_digit subject in
  match casted with Some x -> x <= 9 && x >= 0 | None -> false

(*
The documentation for this function
can be found in the provided interface.
*)
let is_letter (subject : char) : bool =
  let index = letter_pos subject 0 in
  index >= 1 && index <= 26

(*
The documentation for this function
can be found in the provided interface.
*)
let reduce_chars_to_number (subject : char) (letter_weight : int)
    (special_weight : int) : int =
  if is_number subject then
    match char_as_digit subject with Some x -> x | None -> 0
  else if is_letter subject then letter_pos subject 0 * letter_weight
  else special_weight

(*
The documentation for this function
can be found in the provided interface.
*)
let rec security_score (letter_weight : int) (special_weight : int)
    (subject : string) (starter : int) (sum : int) : (int, string) result =
  if subject = "" then Error "Not a valid password string."
  else if starter >= String.length subject then Ok sum
  else if
    starter != 0
    && is_number subject.[starter]
    && is_number subject.[starter - 1]
  then
    let one_res = char_as_digit subject.[starter] in
    let two_res = char_as_digit subject.[starter - 1] in
    match (one_res, two_res) with
    | Some x, Some y ->
        let reduced = digit_distance x y in
        let sum = sum + reduced in
        security_score letter_weight special_weight subject (starter + 1) sum
    | Some _, None -> Error "Invalid digit at previous position."
    | None, Some _ -> Error "Invalid digit at current position."
    | None, None -> Error "Both digits are invalid."
  else
    let reduced =
      reduce_chars_to_number subject.[starter] letter_weight special_weight
    in
    let sum = sum + reduced in
    security_score letter_weight special_weight subject (starter + 1) sum

(*
The documentation for this function
can be found in the provided interface.
*)
let is_secure (letter_weight : int) (special_weight : int) (subject : string)
    (cut_off : int) : (bool, string) result =
  let score = security_score letter_weight special_weight subject 0 0 in
  match score with Ok achieved -> Ok (achieved > cut_off) | Error e -> Error e
