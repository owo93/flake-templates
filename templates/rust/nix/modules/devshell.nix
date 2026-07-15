{
  perSystem =
    { pkgs, rustToolchain, ... }:
    {
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
}
