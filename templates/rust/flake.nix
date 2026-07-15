{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "x86_64-darwin"
        "aarch64-linux"
        "aarch64-darwin"
      ];

      perSystem =
        {
          inputs',
          pkgs,
          lib,
          ...
        }:
        let
          rustToolchain = inputs'.fenix.packages.fromToolchainFile {
            file = ./rust-toolchain.toml;
            sha256 = lib.fakeSha256;
          };
        in
        {
          _module.args = { inherit rustToolchain; };

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              pkg-config
              openssl

              rustToolchain
            ];

            shellHook = ''
              echo "Rust $(rustc --version) dev environment is ready"
            '';
          };
        };
    };
}
