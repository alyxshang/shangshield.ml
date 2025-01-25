(*
 * ShangShield.ml by Alyx Shang.
 * Licensed under the FSL v1.
 *)

(*
 * Importing the library 
 * for unit testing. 
 *)
open OUnit2

(*
 * Importing the Shangshield library 
 * for unit testing. 
 *)
open Shangshield

(*
 * The function to test the 
 * "digit_distance" function. 
 *)
let test_digit_distance _ =
  let distance = digit_distance 8 5 in
  assert_equal 3 distance

(*
 * The function to test the 
 * "char_as_digit" function. 
 *)
let test_char_as_digit _ =
  let converted = char_as_digit '3' in
  match converted with
  | Some x -> assert_equal 3 x
  | None -> print_endline "No valid digit supplied."

(*
 * The function to test the 
 * "letter_pos" function. 
 *)
let test_letter_pos _ =
  let fetched = letter_pos 'a' 0 in
  assert_equal 1 fetched

(*
 * The function to test the 
 * "is_number" function. 
 *)
let test_is_number _ =
  let checked = is_number '1' in
  assert_equal true checked

(*
 * The function to test the 
 * "is_letter" function. 
 *)
let test_is_letter _ =
  let checked = is_letter 'a' in
  assert_equal true checked

(*
 * The function to test the 
 * "reduce_chars_to_number" function. 
 *)
let test_reduce_chars_to_number _ =
  let reduced = reduce_chars_to_number 'h' 5 6 in
  assert_equal 40 reduced

(*
 * The function to test the 
 * "security_score" function. 
 *)
let test_security_score _ =
  let scored = security_score 5 6 "1964AlphaVille" 0 0 in
  match scored with Ok y -> assert_equal 504 y | Error e -> failwith e

(*
 * The function to test the 
 * "is_secure" function. 
 *)
let test_is_secure _ =
  let evald = is_secure 5 6 "1964AlphaVille" 420 in
  match evald with Ok i -> assert_equal true i | Error e -> failwith e

(*
 * The function to 
 * declare the test
 * suite.
 *)
let suite =
  "test_suite"
  >::: [
         "test_is_secure" >:: test_is_secure;
         "test_is_letter" >:: test_is_letter;
         "test_is_number" >:: test_is_number;
         "test_letter_pos" >:: test_letter_pos;
         "test_char_as_digit" >:: test_char_as_digit;
         "test_digit_distance" >:: test_digit_distance;
         "test_security_score" >:: test_security_score;
         "test_reduce_chars_to_number" >:: test_reduce_chars_to_number;
       ]

(*
 * The function to call
 * and execute the test
 * suite.
 *)
let () = run_test_tt_main suite
