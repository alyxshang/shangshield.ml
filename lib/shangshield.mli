(*
 * ShangShield.ml by Alyx Shang.
 * Licensed under the FSL v1.
 *)

val digit_distance : int -> int -> int
(** Calculates the distance between two digits, irrespective of whether one is
    larger than the other. *)

val char_as_digit : char -> int option
(** Attempts to match a character against a digit and returns the matching
    integer. If a non-digit character is supplied, a [None] variant is returned.
*)

val letter_pos : char -> int -> int
(** Attempts to retrieve the position of a letter from the alphabet. These
    positions range from 1 to 26. *)

val is_number : char -> bool
(** Attempts to check whether the supplied character is an integer. *)

val is_letter : char -> bool
(** Attempts to check whether the supplied character is a letter. *)

val reduce_chars_to_number : char -> int -> int -> int
(** Attempts to reduce every supplied type of character to a number. This number
    is returned as an integer. *)

val security_score : int -> int -> string -> int -> int -> (int, string) result
(** This function calculates the security score of the supplied password using
    the supplied weights. If this operation fails, an error is returned. *)

val is_secure : int -> int -> string -> int -> (bool, string) result
(** This function calculates the security score of the supplied password and
    compares the calculated score to the cut-off value that, if smaller than the
    calculated score, means that the password is secure enough. If the password
    is invalid, an error is returned. *)
