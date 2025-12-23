(** Day 1: Secret Entrance *)
let load_rotations filename =
  In_channel.with_open_text filename In_channel.input_lines

let positive_modulo position = ((position mod 100) + 100) mod 100

let convert_rotation rotation_string =
  let len_s = String.length rotation_string in
  let value = int_of_string (String.sub rotation_string 1 (len_s - 1)) in
  if String.starts_with ~prefix:"R" rotation_string then value else -value

let rec calculate_positions rotations current_position =
  match rotations with
  | [] -> []
  | h :: t ->
      let new_position = positive_modulo (current_position + h) in
      new_position :: calculate_positions t new_position

let rec count_exact_zeros positions =
  match positions with
  | [] -> 0
  | h :: t -> count_exact_zeros t + if h = 0 then 1 else 0

(* Break into two steps: does it hit zero once? If so, how many full rotations does it make after that? *)
let count_passing_zeros old_position rotation =
  let new_position = old_position + rotation in
  if new_position <= 0 then
    (* moved left enough to hit or pass zero *)
    (-new_position / 100) + if old_position = 0 then 0 else 1
  else if new_position >= 100 then
    (* moved right enough to pass zero *)
    new_position / 100
  else
    (* started and ended within bounds *)
    0

(* As we update a position, we calculate the number of times it passed zero *)
let rec calculate_positions_and_zeros rotations current_position =
  match rotations with
  | [] -> 0
  | h :: t ->
      let new_position = positive_modulo (current_position + h) in
      count_passing_zeros current_position h
      + calculate_positions_and_zeros t new_position

let part1 filename =
  let rotations = List.map convert_rotation (load_rotations filename) in
  let positions = calculate_positions rotations 50 in
  string_of_int @@ count_exact_zeros positions

let part2 filename =
  let rotations = List.map convert_rotation (load_rotations filename) in
  string_of_int @@ calculate_positions_and_zeros rotations 50
