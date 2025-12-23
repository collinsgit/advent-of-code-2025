(lang dune 3.20)

(name advent-of-code-2025)

(generate_opam_files true)

(source
 (github collinsgit/advent-of-code-2025))

(authors "Collin Potts")

(maintainers "Collin Potts")

(license LICENSE)

(documentation https://github.com/collinsgit/advent-of-code-2025/blob/main/README.md)

(package
 (name advent-of-code-2025)
 (synopsis "Advent of Code 2025")
 (description "OCaml solutions to 2025 Advent of Code problems")
 (depends ocaml (ocamlformat :with-test) (alcotest :with-test))
 (tags
  ("add topics" "to describe" your project)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
