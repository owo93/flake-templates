# flake templates

![built with nix](https://img.shields.io/badge/-Built%20with%20Nix-darkslateblue)
![MIT License](https://img.shields.io/badge/license-MIT-blue)

A collection of nix flake templates for creating common dev environments

## Usage

To initialize a new project with your desired template:

```sh
nix flake init --template github:owo93/flake-templates#name
```

| name        | desc                                                                                                                                                                                           |
| ----------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **trivial** | Very basic flake-parts flake, the default template                                                                                                                                             |
| **rust**    | Rust project template w/ [`flake-parts`](https://github.com/hercules-ci/flake-parts) + [`fenix`](https://github.com/nix-community/fenix) + [`naersk`](https://github.com/nix-community/naersk) |
