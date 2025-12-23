let usage_message = "aoc <day>"
let input_day = ref 0
let anon_fun day = input_day := int_of_string day

let print day part result =
  Printf.printf "Day %i, Part %i: %s\n" day part result

let () =
  Arg.parse [] anon_fun usage_message;
  if !input_day = 1 then begin
    let filename = "./data/day1.txt" in
    print 1 1 (Advent_of_code_2025.Day1.part1 filename);
    print 1 2 (Advent_of_code_2025.Day1.part2 filename)
  end
  else print_endline "Skipping unknown day"
