# SHANGSHIELD.ML :dragon: :camel:

![GitHub CI](https://github.com/alyxshang/shangshield.ml/actions/workflows/ocaml.yml/badge.svg)

***An OCaml package to measure the security of passwords. :dragon: :camel:***

## ABOUT :books:

This repository contains an OCaml package to check the security of your passwords using the Shang algorithm.

## USAGE :hammer:

### Requirements

To use this library, you will have to have the following tools installed and available as commands from a shell session:

- [The OCaml compiler](https://ocaml.org/install): The compiler for OCaml code.
- [Opam](https://opam.ocaml.org/): OCaml's package manager.
- [Dune](https://dune.build/): OCaml's build tool.

### Installation

To use ***Shangshield.ml*** in your OCaml project, please execute the following commands from a shell session:

- 1.) Tell Opam about ***Shangshield***:

```bash
opam pin add git+https://github.com/alyxshang/shangshield.ml#v.0.1.0
```

- 2.) Install ***Shangshield*** into your Opam switch:

```bash
opam install shangshield
```

After these commands have been executed, you must also add the expression `shangshield` to your `dune-project` file and any `dune` files. The library's APIs can be included in any OCaml code by including the line `open Shangshield`.

### API Documentation

To view this package's API, first run the command `opam install .` from this repository's root and follow that command with the command `dune build @doc`. After you have executed these commands, you can open the generated documentation located at the path `_build/default/_doc/_html/index.html` using your browser.

### Unit tests

To run the included unit tests, please run the commands `opam install .` and `dune runtest` from this repository's root.

### Linting checks

To run a linter on the code, please run the commands `opam install .` and `dune fmt` from this repository's root.

## CHANGELOG :black_nib:

### Version 0.1.0

- Initial release.
- Upload to GitHub.

## NOTE :scroll:

- *Shangshield.ml :dragon: :camel:* by *Alyx Shang :black_heart:*.
- Licensed under the [FSL v1](https://github.com/alyxshang/fair-software-license).
