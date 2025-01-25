(lang dune 3.16)
(name shangshield)
(generate_opam_files true)
(source
 (github alyxshang/shangshield.ml))
(authors "Alyx Shang")
(maintainers "Alyx Shang")
(license LicenseRef-FSL)
(documentation https://github.com/alyxshang/shangshield.ml)
(package
 (name shangshield)
 (synopsis "An OCaml package to measure the security of passwords")
 (description "An OCaml package to measure the security of passwords using the Shang algorithm")
 (depends 
  ocaml
  dune
  odoc
  (ounit2  (= "2.2.7"))
  (ocamlformat (= "0.27.0"))
 )
 (tags
  (topics "security")))
