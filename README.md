# flake templates

A collection of nix flake templates for creating common dev environments

## Usage

To initialize a new project with your desired template:

```sh
nix flake init --template github:owo93/flake-templates#name
```

| name        | desc                                               |
| ----------- | -------------------------------------------------- |
| **trivial** | Very basic flake-parts flake, the default template |
| **rust**    | rust dev environment with fenix (stable toolchain) |
