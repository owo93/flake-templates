{
  description = "A collection of opinionated flake templates";

  outputs =
    { self, ... }:
    {
      templates = {
        rust = {
          path = ./templates/rust;
          description = "Rust development environment with fenix";
        };

        default = self.templates.rust;
      };
    };
}
