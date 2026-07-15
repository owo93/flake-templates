{
  perSystem =
    {
      pkgs,
      naersk,
      rustToolchain,
      ...
    }:
    let
      naersk' = pkgs.callPackage naersk {
        cargo = rustToolchain;
        rustc = rustToolchain;
      };
      cargoToml = fromTOML (builtins.readFile ../../Cargo.toml);
    in
    {
      packages.default = naersk'.buildPackage {
        pname = cargoToml.package.name;
        version = cargoToml.package.version;

        src = ../..;
        cargoLock = ../../Cargo.lock;

        strictDeps = true;
        doCheck = true;
      };
    };
}
