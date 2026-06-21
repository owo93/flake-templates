# flake templates
![built with nix](https://img.shields.io/badge/-Built%20with%20Nix-darkslateblue) ![GitHub License](https://img.shields.io/github/license/owo93/flake-templates)

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
