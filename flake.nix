{
  description = "A collection of opinionated flake templates";

  outputs =
    { self, ... }:
    {
      templates = {
        trivial = {
          path = ./templates/trivial;
          description = "A very basic flake w/ flake-parts";
        };

        rust = {
          path = ./templates/rust;
          description = "Rust development environment with fenix";
        };

        pnpm = {
          path = ./templates/pnpm;
          description = "Node.js development environment with npm";
        };

        default = self.templates.rust;
      };
    };
}
