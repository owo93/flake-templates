{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

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
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              bun
            ];

            shellHook = ''
              if [ ! -d "node_modules" ] && [ -f "package.json" ] && [ ! -f "bun.lock" ]; then
                echo "Installing node dependencies w/ bun"
                bun install
              fi

              echo "Bun $(bun --version) dev environment is ready"
            '';
          };
        };
    };
}
