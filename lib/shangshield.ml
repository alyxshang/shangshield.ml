(*
* ShangShield.ml by Alyx Shang.
* Licensed under the FSL v1.
*)

(**
* Attempts to match a character against 
* a digit and returns the matching integer. 
* If a non-digit character is supplied, 0 
* is returned. 
*)
let char_as_digit (subject: char) : int =
    if subject == '0' then 0
    else if subject == '1' then 1
    else if subject == '2' then 2
    else if subject == '3' then 3
    else if subject == '4' then 4
    else if subject == '5' then 5
    else if subject == '6' then 6
    else if subject == '7' then 7
    else if subject == '8' then 8
    else if subject == '9' then 9
    else -1

(**
* Attempts to retrieve the position
* of a letter from the alphabet. These
* positions range from 1 to 26. 
*)
let rec letter_pos (subject: char) (starter: int) : int =
    let alphabet = "abcdefghijklmnopqrstuvwxyz" in
    let lower = Char.lowercase_ascii subject in
    if starter >= 26 then -1
    else if alphabet.[starter] == lower then starter+1
    else letter_pos subject (starter + 1)

(**
* Attempts to check whether the supplied
* character is an integer. 
*)
let is_number (subject: char) : bool =
    let casted = char_as_digit subject in
    casted <= 9 && casted >= 0

(**
* Attempts to check whether the supplied
* character is a letter. 
*)
let is_letter (subject: char) : bool =
    let index = letter_pos subject 0 in
    index >= 1 && index <= 26

(**
* Attempts to reduce every supplied
* type of character to a number. This
* number is returned as an integer. 
*)
let reduce_chars_to_number 
    (subject: char) 
    (letter_weight: int)
    (special_weight: int): int =
    if is_number subject then char_as_digit subject
    else if is_letter subject then letter_pos subject 0 * letter_weight
    else special_weight

(**
* This function calculates the security 
* score of the supplied password
* using the supplied weights. 
*)
let rec security_score 
    (letter_weight: int) 
    (special_weight: int) 
    (subject: string) 
    (starter: int) 
    (sum: int): int =
    if starter >= String.length(subject) then 
        sum
    else  
        let reduced = reduce_chars_to_number subject.[starter] letter_weight special_weight in
        let sum = sum + reduced in
        security_score letter_weight special_weight subject (starter+1) sum

(**
* This function calculates the security 
* score of the supplied password
* and compares the calculated score
* to the cut-off value that, if smaller
* than the calculated score, means that the
* password is secure enough.
*)
let is_secure 
    (letter_weight: int) 
    (special_weight: int) 
    (subject: string) 
    (cut_off) : bool =
    let score = security_score letter_weight special_weight subject 0 0 in
    score > cut_off