{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        {
          system,
          pkgs,
          inputs',
          ...
        }:
        {
          # self' and inputs' provides access to the underlying
          # system's attributes
          packages.default = pkgs.hello;

          # Common perSystem outputs:
          # devShells.default = pkgs.mkShell { ... };
          # apps.default = { type = "app"; program = ... };
        };
      flake = {
        # Normal flake attributes are defined here:
        # overlays = { ... };
        # nixosModules = { ... };
        # homeManagerModules = { ... };
      };
    };
}
