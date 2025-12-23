let test_part1 () =
  let expected = "113" in
  let actual = Advent_of_code_2025.Day1.part1 "./data/day1.txt" in
  Alcotest.(check string) "same string" actual expected

let test_part2 () =
  let expected = "720" in
  let actual = Advent_of_code_2025.Day1.part2 "./data/day1.txt" in
  Alcotest.(check string) "same string" actual expected

let () =
  let open Alcotest in
  run "Day 1"
    [
      ("part 1", [ test_case "Part 1 correctness" `Quick test_part1 ]);
      ("part 2", [ test_case "Part 2 correctness" `Quick test_part2 ]);
    ]
